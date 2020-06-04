class MenuItemsController < ApplicationController
    def index
      render "index"
    end
    def create
      new_menu_item = MenuItem.new(menu_item_params)
      new_menu_item.save!
      redirect_to menu_items_path
    end
    def update
      price=params[:price]
      id=params[:id]
      menu_item=MenuItem.find(id)
      menu_item.price=price
      menu_item.save!
      redirect_to menu_items_path
    end
    def destroy
      id=params[:id]
      menu_item=MenuItem.find(id)
      menu_item.destroy
      redirect_to menu_items_path
    end
    private
      def menu_item_params
        params.permit(:name, :price, :description, :category, :image)
      end
  end