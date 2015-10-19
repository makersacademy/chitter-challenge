module ChitterHelpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def user_name(user)
    "#{user.name} (@#{user.username})"
  end

  def peep_details(user, datetime)
    datetime.strftime("peeped by #{username(user)} at %T on %F")
  end

  def pretty_errors(errors)
    errors << 'Please try again.'
    errors.uniq.join('. ')
  end
end
