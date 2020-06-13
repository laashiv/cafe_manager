class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    if params[:email] != "" && (User.find_by(email: params[:email]))
      flash[:duplicate_account_error] = "You already have an account with the Email Id. Please login to continue."
      redirect_to new_user_path
    elsif (params[:name] == "" || params[:email] == "" || params[:password] == "" || params[:re_password] == "")
      if params[:name] == ""
        flash[:name_error] = "Name is required"
      end
      if params[:email] == ""
        flash[:email_error] = "Email is required: ex@abc.xyz"
      end
      if params[:password] == ""
        flash[:password_error] = "Password is required"
      end
      if params[:re_password] == ""
        flash[:re_password_error] = "Re-enter password is required"
      end
      redirect_to new_user_path
    elsif (params[:password] != params[:re_password])
      flash[:mismatch_error] = "Password mismatch"
      redirect_to new_user_path
    else
      user = User.create!(
        name: params[:name],
        email: params[:email],
        role: "customer",
        password: params[:password],
      )
      session[:current_user_id] = user.id
      Cart.create!(
        user_id: user.id,
        no_of_items: 0,
        total: 0,
      )
      redirect_to "/"
    end
  end

  def update
    id = params[:id]
    user = User.find(id)
    if user.role == "customer"
      user.role = "clerk"
    elsif user.role == "clerk"
      user.role = "customer"
    end
    user.save!
    if user.role == "clerk"
      redirect_to users_list_path
    else
      redirect_to clerks_list_path
    end
  end
end
