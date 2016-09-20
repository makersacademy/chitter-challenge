module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
  def check_path
    request.path_info
  end
end
