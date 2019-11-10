def set_credentials(credentials)
  session[:first_name] = @user_credentials[3]
  session[:user_id] = @user_credentials[0]
  session[:bitter_handle] = @user_credentials[5]
  session[:logged_in] = true
end

def login(credentials)
  if credentials
    set_credentials(credentials)
    flash[:logout] = nil
    redirect '/beets'
  elsif credentials == nil
    flash[:authenticate_message] = "User not found, Please sign up!"
    redirect '/login'
  else
    flash[:authenticate_message] = "Email or Password incorrect"
    redirect '/login'
  end
end

def new_user(user)
  session[:first_name] = params[:first_name]
  session[:bitter_handle] = user.handle
  session[:user_id] = user.id
  session[:logged_in] = true
  redirect '/beets'
end