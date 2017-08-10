# include Application layout => all view can user it
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t"controller.user.logged_in_user.danger"
    redirect_to login_url
  end

  def correct_user
    return if current_user? @user or current_user.admin?
    redirect_to root_url
  end

  def admin_user
    return if current_user.admin?
    redirect_to root_url
  end
end
