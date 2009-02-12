class ShortcutFinderPage < Page
  def find_by_url(url, live = true, clean = true)
    url = clean_url(url) if clean
    slugged_url = url.gsub!(%r{^/},'').gsub!(%r{/$},'')
    unless slugged_url.include?('/')
      children.find_by_class_name('ShortcutDisplayPage')
    else
      super
    end
  end
end