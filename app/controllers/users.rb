get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.create(username: params[:username],
              name: params[:name],
              email: params[:email],
              password: params[:password])
  session[:user_id] = user.id
  redirect to('/')
end