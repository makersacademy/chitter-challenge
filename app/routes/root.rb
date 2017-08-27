
App.get '/' do
  redirect '/login' if session[:username].nil?
  @username = session[:username]
  page :new_post
end
