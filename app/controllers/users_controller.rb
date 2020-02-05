class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

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
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end


  Protected
    def configure_permitted_parameters
    end

  private
    def user_params
      params.require(:user).permit(:name, :email, :introduction, :profile_image, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
end
