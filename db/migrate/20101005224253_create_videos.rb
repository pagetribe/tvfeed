class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :name
      t.string :url
      t.references :widget

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
