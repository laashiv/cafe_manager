class CartItemsController < ApplicationController
  def index
    @cart = cart
    @count = cart.no_of_items
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

  def update
    id = params[:id]
    sign = params[:sign]
    item = current_user.cart.cart_items.find(id)
    if sign == "0"
      item.quantity = item.quantity - 1
      item.save!
      cart.decrement_total(item.menu_item_price, 1, current_user)
    elsif sign == "1"
      item.quantity = item.quantity + 1
      item.save!
      cart.increment_total(item.menu_item_price, current_user)
    end
  end
end
