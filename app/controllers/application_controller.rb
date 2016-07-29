class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :record_activity!

  private

  def record_activity!
    current_user.update_attribute(:active_at, Time.now) if current_user
  end
end
