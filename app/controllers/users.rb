get '/users/new' do
  erb :'users/new'
end

post '/users' do
  name = params[:name]
  username = params[:name]
  email = params[:email]
  password = params[:password_digest]
  @user = User.first_or_create(name: name, username: username, email: email, password_digest: password)

  if @user.save
    flash[:notice] = @user.name #consider adding current_user helper if required
    redirect to('/')
  end
end