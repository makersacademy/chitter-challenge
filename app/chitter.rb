require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  use Rack::MethodOverride

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/all'
  end


  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(email: params[:email],
                        username: params[:username],
                        name: params[:name],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/login' do
    user = user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The Username or Email is incorrect']
     erb :'/users/login'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end