class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  def require_login
  	redirect_to 'sessions/new' unless session[:user_id]  	
  end
  def require_current_user
  	redirect_to "users/#{current_user.id}" if current_user.id != params[:id]
  end
  helper_method :current_user
  helper_method :require_login
  helper_method :require_current_user
end
