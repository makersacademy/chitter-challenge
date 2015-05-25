require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

# ----- DATAMAPPER SETUP BEGIN --------#

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/user'
require './lib/peep'

DataMapper.finalize

DataMapper.auto_upgrade!

# ------ DATAMAPPER SETUP END ---------#

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'seekrit' #why does this have to be set?

  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
    @peeps.reverse!

    erb :index
  end

  post '/' do
    current_user.peep.create(message: params[:peep_message])
    redirect to('/')
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
             username: params[:username],
             email: params[:email],
             password: params[:password] )
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)

    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:notice] = "Sorry, login invalid"
      erb :'/sessions/new'
    end

  end

  delete '/sessions' do
    flash[:notice] = "Goodbye"
    session[:user_id] = nil
    redirect to('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
