class AddNameToWidgets < ActiveRecord::Migration
  def self.up
    add_column :widgets, :name, :string
  end

  def self.down
    remove_column :widgets, :name
  end
end
