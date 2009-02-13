require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  dataset :shortcuts
  
  describe '<r:shortcut_url /> on a shortcut page' do
    subject{pages(:bottom)}
    it { should render("<r:shortcut_url />").as("/bottom/") }
  end
  describe '<r:shortcut_url /> on a regular page' do
    subject{pages(:middle)}
    it { should render("<r:shortcut_url />").as("/top/middle/") }
  end
  
  describe "<r:shortcut_link> on a shortcut page" do
    subject{pages(:bottom)}
    it { should render('<r:shortcut_link />').as('<a href="/bottom/">Bottom</a>') }
    it { should render('<r:shortcut_link>Test</r:shortcut_link>').as('<a href="/bottom/">Test</a>') }
    it { should render('<r:shortcut_link class="test" id="bottom" />').as('<a href="/bottom/" class="test" id="bottom">Bottom</a>') }
    it { should render('<r:shortcut_link anchor="test">Test</r:shortcut_link>').as('<a href="/bottom/#test">Test</a>') }

    it "should render a link for the current contextual page" do
      pages(:middle).should render('<r:children:each><r:shortcut_link /> </r:children:each>' ).as('<a href="/bottom/">Bottom</a> <a href="/top/middle/low/">Low</a> ')
    end

    it { should render('<r:shortcut_link />').with_relative_root('/foo').as('<a href="/bottom/">Bottom</a>') }
  end
end