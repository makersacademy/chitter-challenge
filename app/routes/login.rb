
App.get '/login' do
  redirect '/' if session[:auth]
  page :login
end

App.post '/login' do
  if try_log_in(params)
    session[:username] = params[:username]
    redirect '/'
  else
    redirect '/login'
  end
end
