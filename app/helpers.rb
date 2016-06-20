module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def get_user_by_id(user_id)
    User.first(id: user_id)
  end

end
