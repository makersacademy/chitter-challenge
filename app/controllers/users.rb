class Chitter < Sinatra::Base
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
     password: params[:password],
     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/links')
    else
      #flash.now[:users] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/recover' do
    "Please enter your email address"
    erb :'users/recover'
  end

  post '/users/recover' do
    @user = User.first(email: params[:email])
    if @user
      @user.generate_token
    end
    erb :'users/acknowledgment'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if(@user)
      # "Please enter your new password"
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

   patch '/users' do
     @user = User.find_by_valid_token(params[:token])
     if (@user)
       @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
       redirect '/sessions/new'
     else
       flash.now[:errors] = "Your token is invalid"
       redirect 'users/reset_password'
     end
   end
end