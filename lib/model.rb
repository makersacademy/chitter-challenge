# helper methods

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
  return '/?login=failed' if params[:username] == ""
  session[:user_id] = User.create(username: params[:username], password: params[:password], name: params[:username]).id
  '/feed'
end

def process_new_login(params)
  possible_user = User.first(:username => params[:username])
  return '/?login=failed&user=nil' if possible_user == nil
  check_password(possible_user, params[:password])
end

def check_password(possible_user, password)
  if BCrypt::Password.new(possible_user.password_digest) == password
    session[:user_id] = possible_user.id
    '/feed'
  else
    '/?login=failed'
  end
end

def post_peep(params)
  Peep.create(peep_body: params[:peep_body], user_id: session[:user_id])
end
