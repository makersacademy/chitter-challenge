
def try_log_in(form_hash)
  usr = User.first(
    username: form_hash[:username],
    pass_hash: form_hash[:password]
  )
  session[:messages] << 'incorrect username or password'
  usr != nil
end

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
