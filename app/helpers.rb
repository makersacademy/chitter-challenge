module Helpers

  def session_user
    @session_user ||= User.get(session[:user_id])
  end

  def sign_up_errors?
    @new_user.errors.full_messages.size > 0
  end

  def sign_up_errors
    @new_user.errors.full_messages
  end

  def sign_up_error_type
    flash.now[:error_password] =
    sign_up_errors.select {|message| message.include? 'Dur-brain'}.join("/n")
    flash.now[:error_user_name] =
    sign_up_errors.select {|message| message.include? 'Brother'}.join("/n")
    flash.now[:error_email] =
    sign_up_errors.select {|message| message.include? 'Friend'}.join("/n")
  end

  def memo_flashes
    flash.now[:new_user_email_memo] = @new_user.email
    flash.now[:new_user_user_name_memo] = @new_user.user_name
  end

  def sign_in_error_type
    if @user.nil? && User.first(user_name: params[:existing_user_name])
      'Access Denied Impersonator'
    else
      'Brother, is that really you?'
    end
  end

  def peep_error?
    params[:peep].length >140 || session_user.nil?
  end
  #
  def peep_error_message
    session_user.nil? ? 'This is a members only cult. IMPOSTER' : 'Keep it brief'
  end

  def readable_date(created_on_date)
    created_on_date.strftime("%m/%d/%Y")
  end

  def readable_time(created_at_time)
    created_at_time.strftime("%I:%M%p")
  end


  def peep_owner(peep_author)
    User.get(peep_author)
  end

end
