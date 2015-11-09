class Chitter < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username],
                    email: params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation] )
    if @user.save
      redirect '/sessions/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end

  end

  patch '/users' do
    user = User.find_by_valid_token(params[:token])
    if user.update(password: params[:password],
                   password_confirmation: params[:password_confirmation])
      redirect '/sessions/new'
    else
      flash.next[:errors] = ['Password does not match the confirmation']
      redirect "/users/reset_password?token=#{params[:token]}"
    end
  end
  
  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    @user = User.first(email: params[:email])
    
    if @user
      @user.generate_token
      erb :'users/acknowledgment'
    else
      flash.next[:errors] = ['This email address is not in use']
      redirect '/users/recover'
    end
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if @user
      erb :'/users/reset_password'
    else
      flash.next[:errors] = ["Your token is invalid"]
      redirect '/sessions/new'
    end
  end

end
