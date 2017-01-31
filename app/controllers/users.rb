class Chitter < Sinatra::Base
  get '/users/new' do
    @user_page = true
    erb :'users/new'
  end

  post '/users' do
    @user_page = true
    @user = User.new( name: params[:name],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      @name = @user.name
      @username = @user.username
      @email = @user.email
      @user.errors.full_messages
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/recover' do
    @user_page = true
    erb :'users/recover'
  end

  post '/users/recover' do
    @user_page = true
    user = User.first(email: params[:email])
    if user
      user.generate_token
      SendRecoverLink.call(user)
    end
    erb :'users/acknowledgement'
end

  get '/users/reset_password' do
    @user_page = true
    @user = User.find_by_valid_token(params[:token])
    if @user
      session[:token] = params[:token]
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

  patch '/users' do
    @user_page = true
    user = User.find_by_valid_token(session[:token])
    if user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      session[:token] = nil
      user.update(password_token: nil)
      redirect "/sessions/new"
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/reset_password'
    end
  end
end
