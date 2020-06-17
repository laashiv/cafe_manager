class ContactController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def popup
    flash[:contact_success] = "Thank you for contacting us, we will get back to you shortly."
    redirect_to "/contact"
  end
end
