module CurrentUser

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end