def current_page?(path='')
  request.path_info == '/' + path
end

def logged_in?
  redirect '/' if session[:username] != nil
end

def invalid_peep?
  if params[:peep].length < 1 || params[:peep].length > 500
    return true
  end
end

def invalid_signup?
  if params[:username].length < 4 || params[:username].length > 20
    return true
  elsif params[:name].length < 4 || params[:name].length > 20
    return true
  elsif params[:email].length < 10 || params[:email].length > 30
    return true
  elsif params[:password].length < 8
    return true
  elsif params[:confirm_password].length < 8
    return true
  end
end

def invalid_login?
  if params[:email].length < 10 || params[:email].length > 30
    return true
  elsif params[:password] == ""
    return true
  end
end