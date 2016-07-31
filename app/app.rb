ENV['RACK_ENV'] ||= 'development'
require           'sinatra/flash'
require           'sinatra/base'
require_relative  'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :sessions_secret, 'super sercret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/user/new' do
    @user = User.new
    erb(:'user/new')
  end

  post '/user/new' do
    name                  = params[:name]
    user_name             = params[:user_name]
    email                 = params[:email]
    password              = params[:password]
    password_confirmation = params[:password_confirmation]
    @user = User.create(name: name, user_name: user_name, email: email, password: password, password_confirmation: password_confirmation)
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:error] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
