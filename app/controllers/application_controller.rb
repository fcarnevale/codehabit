class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def profile_url
  	"https://github.com/#{current_user.username}"
  end
  helper_method :profile_url

end
