class Chitter < Sinatra::Base

  get '/users/index' do
    erb :'users/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  get '/users/mycheets' do
    erb :'users/mycheets'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash.next[:new_user] = "Welcome"
      redirect 'users/index', 303
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
