module Helpers

  def prettify(datetime)
    datetime.strftime('peeped at %T on %F')
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def name_handle(user)
    "#{user.name} (@#{user.handle})"
  end

end
