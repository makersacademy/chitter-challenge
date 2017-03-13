module Helpers
  def logged_in_user
    User.get(session[:user_id])
  end

  def check_user_signup_login_details(params)
    if params[:new_signup]
      process_new_signup(params)
    elsif params[:login]
      process_new_login(params)
    end
  end

  def process_new_signup(params)
    return '/?signup=failed&user=nil' if params[:username] == ""
    return '/?signup=failed&user=taken' if User.first(:name => params[:username])
    session[:user_id] = User.create(username: params[:username], password: params[:password], name: params[:username]).id
    proceed_sign_in
  end

  def process_new_login(params)
    possible_user = User.first(:username => params[:username])
    return '/?login=failed&user=nil' if possible_user == nil
    check_password(possible_user, params[:password])
  end

  def check_password(possible_user, password)
    if BCrypt::Password.new(possible_user.password_digest) == password
      session[:user_id] = possible_user.id
      proceed_sign_in
    else
      '/?login=failed'
    end
  end

  def proceed_sign_in
    logged_in_user.email ? '/feed' : '/verify'
  end

  def post_peep(params)
    Peep.create(peep_body: params[:peep_body], user_id: session[:user_id])
  end

  def post_reply(params)
    reply = Reply.create(reply_body: params[:reply_body], user_id: session[:user_id], peep_id: params[:peep_id])
    send_reply_notification_email(reply)
  end

  def verify_account(params)
    return '/verify?verify=failed&user=nil' unless User.first(:username => logged_in_user.username)
    return '/verify?verify=failed&email=taken' if User.first(:email => params[:email])
    return '/verify?verify=failed&pass=failed' unless BCrypt::Password.new(logged_in_user.password_digest) == params[:pass]
    logged_in_user.update(name: params[:name], email: params[:email])
    '/feed'
  end
end
