class CdashController < ApplicationController
  def index
    cart = Cart.find_by(user_id: current_user.id)
    @count = cart.no_of_items
    #@active_menu = Menu.active_menu
    render "index"
  end

  def create
    item_id = params[:mitem_id]
    menu_item = MenuItem.find_by(id: item_id)
    cart = Cart.find_by(user_id: current_user.id)
    CartItem.create!(
      menu_item_id: item_id,
      menu_item_name: menu_item.name,
      menu_item_price: menu_item.price,
      quantity: 0,
      cart_id: cart.id,
    )
    #redirect_to cdash_path
    #head :no_content
  end
end
