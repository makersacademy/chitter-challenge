module ChitterHelpers
  def get_current_user
    @user ||= User.find(session[:id])
  end
end
