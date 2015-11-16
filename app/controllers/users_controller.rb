class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  before_filter :set_user, only: [:edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    render :new unless user.save
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to :root
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end
end
