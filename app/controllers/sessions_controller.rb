class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    check_user = @user.try(:authenticate, params[:user][:password])
    if check_user
      session[:user_id] = check_user.id
      @user = check_user
      redirect_to '/'
    else
      redirect_to '/login'
    end

  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
