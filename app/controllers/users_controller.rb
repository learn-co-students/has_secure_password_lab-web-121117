class UsersController < ApplicationController
  before_action :logged_in?, only: :index

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params).save
    if @user
      session[:user_id] = User.last.id
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def logged_in?
    if current_user != nil
      true
    else
      redirect_to new_session_path
    end
  end

end
