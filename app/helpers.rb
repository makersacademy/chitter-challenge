module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
  def error?
    flash[:errors] && !flash[:errors].empty?
  end
  def peep_poster(peep)
    @peep_poster ||= User.first(id: peep.user_id)
    "#{@peep_poster.name} - @#{@peep_poster.username}"
  end
end
