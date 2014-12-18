class UserSessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to(root_url, notice: 'Welcome back!')
    else
      flash.now[:alert] = "Your login failed, please try again."
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "You are logged out."
  end
end