class AddAttachmentImageToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :books, :image
  end
end
