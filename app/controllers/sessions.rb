get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  username, password = params[:username], params[:password]
  maker = Maker.authenticate(username, password)
  if maker
    session[:maker_id] = maker.id
    redirect to('/')
  else
    flash[:errors] = ["The username or password is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] = "Good bye!"
  session[:maker_id] = nil
  redirect to('/')
end
