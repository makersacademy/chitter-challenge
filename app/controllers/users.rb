get '/users/new' do
  @user = User.new
  erb :'users/new'
end


post '/users/new' do
  @user = User.create(email: params[:email],
                      username: params[:username],
                      password: params[:password])

  if @user.save
    session[:user_id] = @user.id
    flash[:notice] = 'Welcome to chitter!'
    redirect to('/')
  else
    flash[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end
