get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions/new' do
  username, password = params[:username], params[:password]
  user = User.authenticate(username, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  flash[:notice] = "You have logged out successfully"
  session[:user_id] = nil
  redirect to('/')
end