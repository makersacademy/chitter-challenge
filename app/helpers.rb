module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def sign_in(user)
    session[:user_id] = user.id
    redirect to('/chitter')
  end
end
