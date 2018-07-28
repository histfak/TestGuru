class SessionsController < ApplicationController
  before_action :find_user, on: :create

  def new
  end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to cookies[:path] || root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find_by(email: params[:email])
  end
end
