class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :url
      t.string :img_url
      t.string :author
      
      t.timestamps
    end
  end
end
