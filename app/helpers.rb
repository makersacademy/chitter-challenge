
module Helpers
  def current_user
    @user ||=  User.get(session[:user_id])
  end
end