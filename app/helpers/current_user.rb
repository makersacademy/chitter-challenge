module CurrentUser

  def current_user
    User.get(session[:user_id])
  end

  def current_peep
    Peep.get(session[:peep_id])
  end

end
