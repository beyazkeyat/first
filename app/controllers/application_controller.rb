class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'articles', :action => 'index')
      return false
    else
      return true
    end
  end
end
