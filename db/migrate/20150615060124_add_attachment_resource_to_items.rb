class AddAttachmentResourceToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :items, :resource
  end
end
