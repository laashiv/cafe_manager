class MenusController < ApplicationController
  def index
    render "index"
  end

  def active_menu
    render "active-menu"
  end

  def userslist
    render "users-list"
  end

  def clerkslist
    render "clerks-list"
  end

  def sales
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
    render "sales"
  end

  def datewise_search
    redirect_to report_path(start_date: params[:start_date], end_date: params[:end_date])
  end

  def create
    name = params[:name]
    if Menu.count != 0
      new_menu = Menu.new(
        name: name,
        active: false,
      )
      if new_menu.save
        redirect_to menus_path
      else
        flash[:error] = new_menu.errors.full_messages.join(" , ")
        redirect_to menus_path
      end
    else
      new_menu = Menu.create!(
        name: name,
        active: true,
      )
      if new_menu.save
        redirect_to menus_path
      else
        flash[:error] = new_menu.errors.full_messages
        redirect_to menus_path
      end
    end
  end

  def update
    id = params[:id]
    menu = Menu.find_by(active: true)
    menu.active = false
    menu.save!
    menu = Menu.find(id)
    menu.active = true
    menu.save!
    redirect_to menus_path
  end

  def destroy
    id = params[:id]
    menu = Menu.find(id)
    if !(menu.active)
      menu.destroy
    end
    redirect_to menus_path
  end
end
