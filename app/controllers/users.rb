get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.create( username: params[:username],
                      name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
  session[:user_id] = user.id
  redirect to('/')
end