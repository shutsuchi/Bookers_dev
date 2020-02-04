class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :authenticate_user!, except: [:login]
  include SessionHelper
  private

  def authenticates_user!
    if session[:user_id].blanck? || session[:user_email].blank? || session[:user_name].blank?
      reset_session
      redirect_to new_user_path, flash: [error: 'You need Login']
    end
  end

  def current_user?(user)
    current_user.id = user.id
  end

  def user_signed_in?
    current_user.present?
  end
end

