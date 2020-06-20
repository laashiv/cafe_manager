class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :category
    end
  end
end
