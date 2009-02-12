class ShortcutDisplayPage < Page
  
  def virtual?
    true
  end
  
  def cache?
    true
  end
  
  def process(request, response)
    slug = request.request_uri.gsub(%r{^/},'')
    slug = slug.gsub(%r{/$},'')
    Page.find_by_slug(slug).process(request, response)
    ResponseCache.instance.cache_response(request.request_uri, response) if request.get? and cache?
  end
end