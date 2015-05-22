helpers do

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  def base_url
    @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
  end

end
