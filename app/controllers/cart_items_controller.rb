class CartItemsController < ApplicationController
  def index
    @cart = cart
    @count = cart.no_of_items
    if session[:cart_count]
      if !(@count == session[:cart_count])
        session[:coupon] = nil
      end
    end
    if session[:coupon]
      @value = session[:coupon]
    end
    render "index"
  end

  def destroy
    if session[:coupon]
      session[:coupon] = nil
    end
    id = params[:id]
    item = current_user.cart.cart_items.find(id)
    item.destroy
    cart.decrement_total(item.menu_item_price, item.quantity, current_user)
    cart.decrement_no_of_items(current_user)
    redirect_to cart_items_path
  end

  def update
    if session[:coupon]
      session[:coupon] = nil
    end
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

  def create
    couponid = params[:coupon]
    cart = current_user.cart
    orders = Order.where(user_id: current_user.id)
    if couponid == "CHEFOODU30"
      if cart.total >= 499
        flash[:coupon_success] = "Coupon cashback of Rs 30 applied successfully."
        session[:coupon] = couponid
        session[:cart_count] = cart.no_of_items
        redirect_to "/cart_items"
      else
        flash[:coupon_error] = "Coupon chosen is not applicable for your order."
        redirect_to "/cart_items"
      end
    elsif couponid == "CHEFOODU100"
      if !(cart.total >= 499)
        flash[:coupon_error] = "Coupon chosen is not applicable for your order."
        redirect_to "/cart_items"
      elsif !(orders.count >= 10)
        flash[:coupon_error] = "Coupon chosen is not yet available for you. Place orders regularly to avail this coupon"
        redirect_to "/cart_items"
      else
        flash[:coupon_success] = "Coupon cashback of Rs 150 applied successfully."
        session[:coupon] = couponid
        session[:cart_count] = cart.no_of_items
        redirect_to "/cart_items"
      end
    elsif couponid == "CHEFOODU150"
      if cart.total >= 999
        flash[:coupon_success] = "Coupon cashback of Rs 100 applied successfully."
        session[:coupon] = couponid
        session[:cart_count] = cart.no_of_items
        redirect_to "/cart_items"
      else
        flash[:coupon_error] = "Coupon chosen is not applicable for your order."
        redirect_to "/cart_items"
      end
    elsif couponid == "CHEFOODU200"
      if !(cart.total >= 999)
        flash[:coupon_error] = "Coupon chosen is not applicable for your order."
        redirect_to "/cart_items"
      elsif !(orders.count >= 10)
        flash[:coupon_error] = "Coupon chosen is not yet available for you. Place orders regularly to avail this coupon"
        redirect_to "/cart_items"
      else
        flash[:coupon_success] = "Coupon cashback of Rs 200 applied successfully."
        session[:coupon] = couponid
        session[:cart_count] = cart.no_of_items
        redirect_to "/cart_items"
      end
    else
      flash[:coupon_error] = "Invalid coupon. Try another one."
      redirect_to "/cart_items"
    end
  end
end
