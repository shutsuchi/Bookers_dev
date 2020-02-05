class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :authenticate_user!, except: [:login]
  protect_from_forgery with: :exception
  include SessionsHelper

  private

end
