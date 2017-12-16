module UserHelper
  def get_current_user
    @current_user ||= User.first({id: session[:user_id]})
  end
end
