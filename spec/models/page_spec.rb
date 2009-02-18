require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  dataset :shortcuts
  
  it "should require a completely unique slug" do
    Page.new(:slug => 'bottom').should have(1).error_on(:slug)
  end
end