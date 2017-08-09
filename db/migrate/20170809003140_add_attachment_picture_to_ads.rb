class AddAttachmentPictureToAds < ActiveRecord::Migration[5.1]
  def self.up
    change_table :ads do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :ads, :picture
  end
end
