class RemoveImgUrlFromMenuItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_items, :img_url, :text
  end
end
