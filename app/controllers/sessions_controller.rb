class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{@user.name}"
      redirect_to root_path
    else
      @user = User.create(name: params[:user][:name])
      if session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.name}"
        redirect_to root_path
      else
        flash.now[:error] = "Not logged in"
        render :new
      end
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end

end
