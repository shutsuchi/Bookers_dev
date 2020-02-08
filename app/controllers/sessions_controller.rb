class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if params[:session]
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] == user.id
      redirect_to user
    else
      @user = User.new
      render :new
    end
     end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email,:password_digest)
  end
end
