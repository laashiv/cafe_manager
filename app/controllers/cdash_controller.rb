class CdashController < ApplicationController
  def index
    #cart = Cart.find_by(user_id: current_user.id)
    @current_user = current_user
    @cart = cart
    @count = cart.no_of_items
    @active_menu = Menu.active_menu
    render "index"
  end

  def create
    item_id = params[:mitem_id]
    menu_item = MenuItem.find_by(id: item_id)
    #@cart = current_user.cart
    CartItem.create!(
      menu_item_id: item_id,
      menu_item_name: menu_item.name,
      menu_item_price: menu_item.price,
      menu_item_category: menu_item.category,
      quantity: 1,
      cart_id: cart.id,
    )
    cart.increment_total(menu_item.price, current_user)
    cart.increment_no_of_items(current_user)
    #redirect_to cdash_path
    #head :no_content
  end
end
