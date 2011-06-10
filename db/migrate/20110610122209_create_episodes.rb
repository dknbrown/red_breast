class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.string :title
      t.string :slogan
      t.string :location
      t.string :css
      t.string :bg_img

      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
