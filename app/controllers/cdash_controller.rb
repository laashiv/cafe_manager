class CdashController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    @current_user = current_user
    @active_menu = Menu.active_menu
    #cart = Cart.find_by(user_id: current_user.id)
    if (current_user)
      cart.update_cart(current_user)
      @cart = cart
      @count = cart.no_of_items
    end
    render "index"
  end

  def create
    item_id = params[:mitem_id]
    menu_item = MenuItem.find_by(id: item_id)
    #@cart = current_user.cart
    citem = CartItem.create!(
      menu_item_id: item_id,
      menu_item_name: menu_item.name,
      menu_item_price: menu_item.price,
      menu_item_category: menu_item.category,
      quantity: 1,
      cart_id: cart.id,
    )
    #citem.image.attach(url_for(menu_item.image))
    #citem.save!
    cart.increment_total(menu_item.price, current_user)
    cart.increment_no_of_items(current_user)
    #redirect_to cdash_path
    #head :no_content
  end
end
