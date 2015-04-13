get '/user/new' do
  @user = User.new
  erb :'user/new'
end

post '/user' do
  @user = User.create(user_name: params[:user_name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/welcome_message')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'user/new'
  end
end