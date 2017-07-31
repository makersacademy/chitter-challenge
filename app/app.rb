ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/peep'
require_relative 'models/user'
require 'database_cleaner'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @user = current_user
    peep = Peep.create(content: params[:content], user_id: current_user.id)
    peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], name: params[:name],
              username: params[:username], password: params[:password],
              password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      erb :'users/welcome'
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
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Bye!'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
