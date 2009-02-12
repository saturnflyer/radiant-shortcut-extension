# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ShortcutExtension < Radiant::Extension
  version "1.0"
  description "Allow pages to be accessed by their un-nested slug."
  url "http://saturnflyer.com/"
  
  def activate
    if ActiveRecord::Base.connection.tables.include?('config')
      Radiant::Config['defaults.page.shortcut?'] = false unless Radiant::Config['defaults.page.shortcut?']
    end
    Page.class_eval {
      validates_uniqueness_of :slug
      include ShortcutTags
    }
    admin.pages.edit.add :extended_metadata, 'shortcut'
  end
  
end
