class CreateLinkMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :link_menu_items do |t|
      t.integer "menu_id"
      t.integer "menu_item_id"
    end
  end
end
