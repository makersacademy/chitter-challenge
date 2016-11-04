require './app/models/user.rb'

class Chitter < Sinatra::Base
  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users/signup' do
    user = User.create(get_options)
    if user.id
      log_in(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect '/users/signup'
    end
  end


  get '/users/signin' do
    erb :'users/signin'
  end

  post '/users/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      log_in(user)
    else
      flash[:errors] = ['Incorrect Email/Password']
      redirect '/users/signin'
    end
  end

  get '/users/signout' do
    flash[:message] = "Goodbye, #{current_user.name}"
    session[:user_id] = nil
    redirect '/'
  end

  helpers do
    def log_in(user)
      session[:user_id] = user.id
      flash[:message]  = "Welcome, #{user.name}"
      redirect '/'
    end

    def get_options
      {name: params[:name],
        username: params[:username],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]}
    end
  end
end
