class AddMenuItemCategoryToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :menu_item_category, :string
  end
end
