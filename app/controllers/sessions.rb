get '/sessions/new' do
  @replies_to_id = params[:reply]
  erb :'sessions/new'
end

post '/sessions/new' do
  username = params[:username]
  password = params[:password]
  user = User.authenticate(username, password)
  if user
    session[:user_id] = user.id
    flash[:notice] = 'Login successful'
    redirect to '/'
  else
    flash[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  flash[:notice] = 'Logged out'
  redirect to '/'
end
