class Chitter < Sinatra::Base
  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirm])
    if @user.id
      session[:user_id]=@user.id
      redirect '/'
    else
      flash.now[:error]=@user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/users/recover' do
    erb :'/users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end
    flash.next[:notice]="Please check your inbox to set a new password."
    redirect '/'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if(@user)
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

  patch '/users' do
    user = User.find_by_valid_token(params[:token])
    if user.update(password: params[:password],
                        password_confirmation: params[:password_confirmation])
      redirect '/sessions/new'
    else
      flash.now[:error] = user.errors.full_messages
      erb :'users/reset_password'
    end
  end

end
