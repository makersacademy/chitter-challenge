get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ['The email or password are wrong']
    erb :"sessions/new"
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect to('/')
end
