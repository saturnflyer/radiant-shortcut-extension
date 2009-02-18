require File.dirname(__FILE__) + '/../spec_helper'

describe ShortcutFinderPage do
  dataset :shortcuts
  
  it "should find non shortcut pages by the url" do
    pages(:top).find_by_url('/top/middle/low/').should == pages(:low)
  end
  
  it "should find the shortcut display page by a shortcut url" do
    pages(:top).find_by_url('/bottom/').should == pages(:shortcuts)
  end
end