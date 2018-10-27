module ChitterHelpers
  def get_current_user
    @user ||= User.find(session[:id])
  end

  def get_current_peeps
    @peeps ||= Peep.all
  end
end
