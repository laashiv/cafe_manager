class OrdersController < ApplicationController
  def index
    @current_user = current_user
    render "index"
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.delivered_at = DateTime.now
    order.save!
    redirect_to orders_path
  end

  def create
    order = Order.create!(
      user_id: current_user.id,
      date: Date.today,
      total: cart.total,
    )
    cart_items = current_user.cart.cart_items
    cart_items.each do |citem|
      OrderItem.create!(
        order_id: order.id,
        menu_item_id: citem.menu_item_id,
        menu_item_name: citem.menu_item_name,
        menu_item_price: citem.menu_item_price,
        quantity: citem.quantity,
      )
      citem.destroy
    end
    cart.no_of_items = 0
    cart.total = 0
    cart.save!
    flash[:order_success] = "Your order with Order Id: #chefoodu$#{order.id} had been placed successfully"
    redirect_to "/cdash"
  end
end
