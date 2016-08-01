class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(user_name: params[:user_name], email: params[:email],
    name: params[:name], password_confirmation: params[:password_confirmation],
    password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/users/new')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/recovery' do
    erb :'users/recovery'
  end

  post '/users/recovery' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
      SendEmail.call(user)
    end
    erb :'users/acknowledgement'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if @user
      session[:token] = params[:token]
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

  patch '/users' do
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
