get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user_name, password = params[:user_name], params[:password]
  user = User.authenticate(user_name, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  flash[:notice] = 'Good Bye!'
  session[:user_id] = nil
  redirect to '/'
end