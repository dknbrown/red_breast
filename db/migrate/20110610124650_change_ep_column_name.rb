class ChangeEpColumnName < ActiveRecord::Migration
  def self.up
	rename_column :subject_keywords, :ep, :episode_id
  end

  def self.down
	rename_column :subject_keywords, :episode_id, :ep
  end
end
