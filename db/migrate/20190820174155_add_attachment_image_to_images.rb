class AddAttachmentImageToImages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :images do |t|
      t.string :title
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :images, :image
  end
end
