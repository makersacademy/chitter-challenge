module ViewHelper
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def peeps
    @peeps = Peep.desc
  end
end
