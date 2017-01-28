module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
  def error?
    flash[:errors] && !flash[:errors].empty?
  end
  def peep_header(peep)
    @peep_poster ||= User.first(id: peep.user_id)
    "#{@peep_poster.name} - @#{@peep_poster.username} #{peep.timestamp.strftime "on %a %d %b at %H:%M" }"
  end
end
