require 'data_mapper'
require 'sinatra/base'
require 'rack-flash'
require 'tilt/erb'
require './app/peep'
require './app/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/peep'

DataMapper.finalize
DataMapper.auto_upgrade!

require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    message = params['message']
    Peep.create message: message
    redirect to '/'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation],
                       user_name: params[:user_name],
                       user_handle: params[:user_handle]
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  run! if app_file == $PROGRAM_NAME

end
