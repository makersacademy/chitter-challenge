ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper' #Add in
require 'dm-postgres-adapter'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'
register Sinatra::Flash
use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
    erb(:'/index')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
     password: params[:password],
     name: params[:name],
     username: params[:username])
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
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:notice] = "The email or password is incorrect"
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Logged out'
    redirect to '/'
  end

  get '/' do
    @peeps = Peep.all
    @user = User.first
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/' do
    if current_user
    peep = Peep.create(message: params[:message], username: current_user.username)
      redirect '/'
      else
      redirect '/sessions/new'
      erb :'peeps/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
