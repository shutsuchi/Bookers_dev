class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new
  end

  def update
    user = user.new(user_params)
    user.update
    redirect_to
  end

  def destry
    user = user.find(params[:id])
    user.destroy
    redirect_to
  end


  private user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
