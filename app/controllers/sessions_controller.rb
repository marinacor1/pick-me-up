class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # flash.now[:error] = @user.errors.full_messages.join(", ")
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
