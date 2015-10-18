module CurrentUser

  def current_user
    User.get(session[:user_id])
  end

end
