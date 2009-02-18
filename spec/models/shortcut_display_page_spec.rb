require File.dirname(__FILE__) + '/../spec_helper'

describe ShortcutDisplayPage do
  dataset :shortcuts

  describe "process" do
    before do
      @response = ActionController::TestResponse.new
      @request = ActionController::TestRequest.new
      @request.stub!(:request_uri).and_return('/bottom/')
    end
    it "should find the page by the given slug" do
      Page.should_receive(:find_by_slug).with('bottom').and_return(pages(:bottom))
      pages(:shortcuts).process(@request,@response)
    end
    it "should generate cached files for the shortcut" do
      Page.stub!(:find_by_slug).with('bottom').and_return(pages(:bottom))
      ResponseCache.instance.should_receive(:cache_response).with(@request.request_uri, @response)
      pages(:shortcuts).process(@request,@response)
    end
  end
  
  specify { pages(:shortcuts).virtual?.should be_true }
  specify { pages(:shortcuts).cache?.should be_true }
end