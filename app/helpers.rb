module Helpers

  def current_user
    current ||= User.first(id: session[:user_id])
  end

end