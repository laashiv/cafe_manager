class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      role: "customer",
      password: params[:password],
    )
    if user.save
      session[:current_user_id] = user.id
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
    Cart.create!(
      user_id: user.id,
      no_of_items: 0,
      total: 0,
    )
    redirect_to "/"
  end
end
