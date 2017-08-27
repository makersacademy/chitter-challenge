
App.get '/register' do
  redirect '/' if session[:auth]
  page :register
end

App.post '/register' do
  if try_register(params)
    redirect '/'
  else
    redirect '/register'
  end
end
