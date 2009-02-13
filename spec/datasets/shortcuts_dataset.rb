class ShortcutsDataset < Dataset::Base
  uses :home_page
  
  def load
    # pages(:) 
    create_page 'Top' do
      create_page 'Middle' do
        create_page 'Bottom', :shortcut => true
        create_page 'Low'
      end
    end
  end
end