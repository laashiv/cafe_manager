class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    if (params[:email] == "" || params[:password] == "")
      if params[:email] == ""
        flash[:email_error] = "Email is required: ex@abc.xyz"
      end
      if params[:password] == ""
        flash[:password_error] = "Password is required"
      end
      redirect_to new_sessions_path
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:current_user_id] = user.id
        redirect_to "/"
      else
        flash[:login_error] = "Invalid login credentials. Please retry."
        redirect_to new_sessions_path
      end
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
