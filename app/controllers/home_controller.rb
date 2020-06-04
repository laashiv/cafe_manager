class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    if current_user
      if current_user.role == "admin"
        redirect_to "/menus"
      else
        redirect_to "/cdash"
      end
    else
      render "index"
    end
  end
end
