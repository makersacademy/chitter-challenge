module CurrentUser
  
  def h(text)
    Rack::Utils.escape_html(text)
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def logged_in?
    if current_user
      flash[:notice] = "User already logged in"
      redirect '/'
    end
  end
end
