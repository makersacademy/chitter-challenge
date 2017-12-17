class Chitter < Sinatra::Base

  get '/user/new' do
    @user = User.new
    erb(:'users/signup')
  end

  post '/user' do
    @user = User.create(email: params[:email],
                       name: params[:name],
                       username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/signup')
    end
  end

  get '/user/recover' do
    erb(:'users/recover')
  end

  post '/user/recovery' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end
    erb(:'users/acknowledgement')
  end

  get '/user/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if @user
      session[:token] = params[:token]
      erb(:'users/reset_password')
    else
      "Your token has expired"
    end
  end

  patch '/user' do
    user = User.find_by_valid_token(session[:token])
    if user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      session[:token] = nil
      user.update(password_token: nil)
      redirect to '/sessions/new'
    else
      flash.now[:errors] = user.errors.full_messages
      erb(:'users/reset_password')
    end
  end
end
