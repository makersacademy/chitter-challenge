def save_session_info(user)
  session[:id] = user.id
  session[:user_name] = user.user_name
end

def clear_session_info
  session[:id] = nil
  session[:user_name] = nil
end

def existing_user_check(user)
  if user == nil
    flash[:message] = "Sorry, the username and/or password was entered incorrectly."
    redirect '/session/login'
  end
end

def new_user_check(email, username)
  if User.first(:email => email) != nil
    flash[:message] = "Email address (#{email}) already used."
    redirect '/user/new'
  end
  if User.first(:user_name => username) != nil
    flash[:message] = "User name (#{username}) already taken."
    redirect '/user/new'
  end
end
