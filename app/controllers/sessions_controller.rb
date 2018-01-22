class SessionsController < ApplicationController


  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user.authenticate(params[:password])
      current_user = @user.id
      redirect_to users_page
    else
      return head(:forbidden)
    end
  end
  
end
