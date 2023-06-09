class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  # User registration
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # If user is saved successfully than show flash message
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
