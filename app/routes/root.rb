
App.get '/' do
  redirect '/login' if session[:username].nil?
  @username = session[:username]
  page :new_post
end

App.post '/new_post' do
  try_new_post(params)
  redirect '/'
end
