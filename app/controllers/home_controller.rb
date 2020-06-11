class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    if current_user
      if current_user.role == "admin"
        redirect_to "/menus"
      elsif current_user.role == "customer"
        redirect_to "/cdash"
      else
        redirect_to "/orders"
      end
    else
      render "index"
    end
  end
end
