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
    if params[:start_date] && params[:end_date] != ""
      start_date = params[:start_date]
    else
      start_date = Order.first.date
    end
    if params[:start_date] && params[:end_date] != ""
      end_date = params[:end_date]
    else
      end_date = Date.today
    end
    if @orders
      @orders = @orders.where("date >= ? ", start_date)
    else
      @orders = Order.where("date >= ? ", start_date)
    end
    @orders = @orders.where("date <= ? ", end_date)
    render "sales"
  end

  def datewise_search
    redirect_to report_path(start_date: params[:start_date], end_date: params[:end_date])
  end

  def create
    name = params[:name]
    new_menu = Menu.create!(
      name: name,
      active: false,
    )
    redirect_to menus_path
  end

  def update
    id = params[:id]
    active = params[:active]
    #menu = Menu.find_by(active: true)
    #menu.active = false
    #menu.save!
    menu = Menu.find(id)
    menu.active = true
    menu.save!
    redirect_to menus_path
  end

  def destroy
    id = params[:id]
    menu = Menu.find(id)
    menu.destroy
    redirect_to menus_path
  end
end
