get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  name, username, email, password, password_confirmation = params[:name], params[:username],params[:email], params[:password], params[:password_confirmation]
  @user = User.create(name: name, username: username, email: email, password: password, password_confirmation: password_confirmation)

  if @user.save
    flash[:notice] = @user.name #consider adding current_user helper if required
    redirect to('/')
  else
    flash[:errors] = @user.errors.full_messages
    redirect to('/users/new')
  end
end