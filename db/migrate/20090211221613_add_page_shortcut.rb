class AddPageShortcut < ActiveRecord::Migration
  def self.up
    add_column :pages, :shortcut, :boolean, :default => false
  end

  def self.down
    remove_column :pages, :shortcut
  end
end
