class Chitter < Sinatra::Base
  get '/users/new' do
    redirect '/' if current_user
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/:username' do
    @user = User.first(username: params[:username])
    @peeps = @user.peeps
    erb :'users/user'
  end
end
