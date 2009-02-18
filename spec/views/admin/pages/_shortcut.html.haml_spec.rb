require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/pages/_shortcut" do
  dataset :shortcuts
  describe "on a new page with the default shortcut configuration set to false" do
    before do
      Radiant::Config['defaults.page.shortcut?'] = false
      @page = Page.new
      assigns[:page] = @page
      render "/admin/pages/_shortcut"
    end
    it "should have a shortcut checkbox" do
      response.should have_tag('input[type=?][name=?]','checkbox','page[shortcut]')
    end
  end
  describe "on a new page with the default shortcut configuration set to true" do
    before do
      Radiant::Config['defaults.page.shortcut?'] = true
      @page = Page.new
      assigns[:page] = @page
      render "/admin/pages/_shortcut"
    end
    it "should have a shortcut checkbox" do
      response.should have_tag('input[type=?][name=?][checked=?]','checkbox','page[shortcut]','checked')
    end
  end
  describe "with shortcut set to true" do
    before do
      @page = pages(:bottom)
      assigns[:page] = @page
      render "/admin/pages/_shortcut"
    end
    it "should have a checked shortcut checkbox" do
      response.should have_tag('input[type=?][name=?][checked=?]','checkbox','page[shortcut]','checked')
    end
  end
end