class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.bigint :menu_item_id
      t.string :menu_item_name
      t.float :menu_item_price
      t.integer :quantity
      t.bigint :cart_id
      t.string :menu_item_category
    end
  end
end
