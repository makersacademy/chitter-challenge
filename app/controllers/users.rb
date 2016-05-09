class Chitter < Sinatra::Base
  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation]
                       )
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    user.generate_token if user
    erb :'users/acknowledgement'
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
    if user
      user.update(password: params[:password],
                  password_confirmation: params[:password_confirmation])
      redirect "/sessions/new"
    else
      flash.now[:errors] = ['Password does not match the confirmation']
      erb :'users/reset_password'
    end
  end

end
