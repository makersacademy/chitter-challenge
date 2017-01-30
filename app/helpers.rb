module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

#returns true if current user is logged in
  def logged_in?
    !current_user.nil?
  end

end
