module ChitterHelpers

  def prettify(user, datetime)
    datetime.strftime("peeped by #{name_handle(user)} at %T on %F")
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def name_handle(user)
    "#{user.name} (@#{user.handle})"
  end

end
