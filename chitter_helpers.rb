module ChitterHelpers
  def current_user
    @current_user ||= User.find(session[:id])
  end

  def current_peeps
    @current_peeps ||= Peep.all
  end
end
