class ShortcutsDataset < Dataset::Base
  uses :home_page
  
  def load
    create_page 'Top', :class_name => 'ShortcutFinderPage' do
      create_page 'Middle' do
        create_page 'Bottom', :shortcut => true
        create_page 'Low'
      end
      create_page 'Shortcuts', :class_name => 'ShortcutDisplayPage'
    end
  end
end