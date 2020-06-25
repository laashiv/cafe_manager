class OrdersController < ApplicationController
  def index
    @current_user = current_user
    #@users = User.where(role: "customer")
    @users = User.where(role: "customer").or(User.where(role: "walk-in-customer"))

    #if params[:username] != ""
    #user = User.where(name: params[:username])
    # users = User.where(name: params[:username])
    #id =
    #if @orders
    # @orders = @orders.where(user_id: id)
    #else
    # @orders = Order.where(user_id: id)
    #end
    #end
    #@orders = user.order
    #end

    start_date = Order.first.date
    end_date = Order.last.date

    if params[:start_date] == "" && params[:end_date] == ""
      start_date = Order.first.date
      end_date = Order.last.date
    elsif params[:start_date] != "" && params[:end_date] == ""
      start_date = params[:start_date]
      end_date = Order.last.date
    elsif params[:start_date] == "" && params[:end_date] != ""
      end_date = params[:end_date]
      start_date = Order.first.date
    elsif params[:start_date] && params[:end_date]
      start_date = params[:start_date]
      end_date = params[:end_date]
    end

    if @orders
      @orders = @orders.where("date >= ? ", start_date)
    else
      @orders = Order.where("date >= ? ", start_date)
    end

    if @orders
      @orders = @orders.where("date <= ? ", end_date)
    else
      @orders = Order.where("date <= ? ", end_date)
    end

    if params[:user] && params[:user] != ""
      #user = User.find_by(name: params[:username])
      userid = params[:user]
      if @orders
        @orders = @orders.where(user_id: userid)
      else
        @orders = Order.where(user_id: userid)
      end
    end

    render "index"
  end

  def datewise_search
    redirect_to orders_report_path(start_date: params[:start_date], end_date: params[:end_date], user: params[:user])
  end

  def invoice
    id = params[:id]
    @invoice = Order.find_by(id: id)
    render "invoice"
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
      total: cart.total + (cart.total * 0.18) + 10,
    )

    if current_user.role != "customer"
      order.user_id = 1
      order.save!
    end

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
    if session[:coupon]
      coupon = session[:coupon]
      if coupon == "CHEFOODU30"
        coupon_text = " and Rs 30 will be credited to your account on order delivery"
      elsif coupon == "CHEFOODU100"
        coupon_text = " and Rs 100 will be credited to your account on order delivery"
      elsif coupon == "CHEFOODU150"
        coupon_text = " and Rs 150 will be credited to your account on order delivery"
      elsif coupon == "CHEFOODU200"
        coupon_text = " and Rs 200 will be credited to your account on order delivery"
      end
    else
      coupon_text = ""
    end

    flash[:order_success] = "Your order with Order Id: #chefoodu$#{order.id} has been placed successfully" + coupon_text
    redirect_to "/cdash"
  end
end
