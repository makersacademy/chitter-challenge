class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.keep[:errors] = ["Email and/or username already taken"]
      redirect '/users/new'
    end
  end

  patch '/users' do
    user = User.find_user_by_token(session[:token])
    session[:token] = nil
    user.update(password: params[:password])
    user.update(password_token: nil)
    redirect '/session/new'
  end

  get '/users/password-recovery' do
    erb :'/users/password-recovery'
  end

  post '/users/password-recovery' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
      SendEmail.call(user)
    end
    erb :'users/password-reset-acknowledgement'
  end

  get '/users/reset_password' do
    user = User.find_user_by_token(params['token'])
    if user
      session[:token] = params['token']
      erb :'/users/new_password'
    else
      "Token invalid"
    end
  end

end
