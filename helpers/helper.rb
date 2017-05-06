def login?
  if session[:user_id].nil?
    return false
  else
    return true
  end
end

def username
  return session[:username]
end

def current_user
 @current_user ||= User.get(session[:user_id])
end
