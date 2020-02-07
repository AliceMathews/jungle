class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    elsif @user && !@user.authenticate(params[:password])
      flash[:alert] = "Incorrect password"
      redirect_to "/login"
    elsif !@user
      flash[:alert] = "User does not exist"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end
