module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def error?
    flash[:errors] && !flash[:errors].empty?
  end

  def peep_header(peep)
    @peep_poster ||= User.first(id: peep.user_id)
    user = "<strong>#{@peep_poster.name}</strong> - @#{@peep_poster.username}"
    post_time = (peep.timestamp.strftime 'on %a %d %b at %H:%M').to_s
    user + ' ' + post_time
  end

  def comment_user(comment)
    peep_header(Comment.first(content: comment))
  end
end
