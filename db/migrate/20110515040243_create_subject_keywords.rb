class CreateSubjectKeywords < ActiveRecord::Migration
  def self.up
    create_table :subject_keywords do |t|
      t.string :keyword
      t.integer :ep

      t.timestamps
    end
  end

  def self.down
    drop_table :subject_keywords
  end
end
