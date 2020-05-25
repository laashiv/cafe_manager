class RemoveCategoryIdFromMenuItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_items, :category_id, :bigint
  end
end
