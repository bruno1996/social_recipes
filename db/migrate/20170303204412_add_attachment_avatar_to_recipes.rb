class AddAttachmentAvatarToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :recipes, :avatar
  end
end
