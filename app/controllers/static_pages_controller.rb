# StaticPagesController class
class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @user = current_user
  end

  def help; end

  def about; end

  def contact; end
end
