class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.bigint :menu_id
      t.bigint :category_id
      t.string :name
      t.text :description
      t.float :price
      t.text :img_url
    end
  end
end
