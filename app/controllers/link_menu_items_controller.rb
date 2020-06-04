class LinkMenuItemsController < ApplicationController
  def create
    menu_id = params[:id1]
    menu_items_id = params[:id2]
    new_connector = LinkMenuItem.create!(
      menu_id: menu_id,
      menu_item_id: menu_items_id,
    )
    redirect_to menus_path
  end

  def destroy
    id1 = params[:id1]
    id2 = params[:id2]
    link = LinkMenuItem.find_by(menu_id: id1, menu_item_id: id2)
    link.destroy
    redirect_to menus_path
  end
end
