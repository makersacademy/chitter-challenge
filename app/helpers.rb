module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def format_date_time(datetime)
    datetime.strftime("%c")
  end


end
