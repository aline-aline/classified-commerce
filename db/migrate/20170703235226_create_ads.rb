class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :title, limit: 255
      t.text :description
      t.references :member, foreign_key: true
      t.references :category

      t.timestamps
    end
  end
end
