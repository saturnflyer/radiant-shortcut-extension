module ShortcutTags
  include Radiant::Taggable
  
  desc %{
    Provides the path to the page as a shortcut if the
    page is set to be a shortcut, or provides the full
    path like the standard 'url' tag.
  }
  tag 'shortcut_url' do |tag|
    tag.locals.page.shortcut? ? %{/#{tag.locals.page.slug}} : tag.render('url')
  end
  
  desc %{
    Provides a link to the shortcut URL, or the actual URL
    if the page is not set to be a shortcut.
      
    This tags works just like the standard 'link' tag.
  }
  tag 'shortcut_link' do |tag|
    page = tag.locals.page
    options = tag.attr.dup
    anchor = options['anchor'] ? "##{options.delete('anchor')}" : ''
    attributes = options.inject('') { |s, (k, v)| s << %{#{k.downcase}="#{v}" } }.strip
    attributes = " #{attributes}" unless attributes.empty?
    text = tag.double? ? tag.expand : tag.render('title')
    %{<a href="#{tag.render('shortcut_url')}#{anchor}"#{attributes}>#{text}</a>}
  end
end