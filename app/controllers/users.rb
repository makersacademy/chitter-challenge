get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  username = params[:username]
  username.gsub!(/\s/, '_')
  @user = User.create(username: username,
                      name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users' do
  if params[:username].nil?
    redirect to('/')
  else
    username = params[:username]
    @user = User.first(username: username)
    erb :'users/username'
  end
end