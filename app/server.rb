require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'byebug'

class ChitterWeb < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

#This will allow us to use a new method in our server file, 'delete'
use Rack::MethodOverride

#tells you where your views are..
set :views, Proc.new { File.join(root, "", "views") }

env = ENV['RACK_ENV'] || 'dev'
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

p "I'm connected to #{env} !!!!!!!!"



#require our classes/models
require './lib/user'

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!



  get '/' do
    @message = "If you would like to peep please register"
    erb :index
  end

  post '/peep/new' do
    @peep_msg = Peep.new(peep_msg: params[:peep_msg])
    if Peep.save
      @message = "Thank you for your thoughts"
      redirect to('/')
    else
      flash.now[:errors] = ['Your peep is chit']
      erb :index
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    fullname: params[:fullname],
                    username:params[:username])
    if @user.save
      session[:user_id] = @user.id
      @message = "Welcome to Chitter #{@user.username}"
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  delete '/sessions' do
    flash.now[:errors] = ["You've just logged out"]
    session[:user_id] = nil
    redirect to('/')
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
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
