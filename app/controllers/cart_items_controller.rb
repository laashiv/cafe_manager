class CartItemsController < ApplicationController
  def index
    @cart = cart
    render "index"
  end

  def destroy
    id = params[:id]
    item = current_user.cart.cart_items.find(id)
    item.destroy
    cart.decrement_total(item.menu_item_price, item.quantity, current_user)
    cart.decrement_no_of_items(current_user)
    redirect_to cart_items_path
  end
end
