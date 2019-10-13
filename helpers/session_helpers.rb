module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
end