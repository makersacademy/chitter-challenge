ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'bcrypt'

class Chitter < Sinatra::Base
  
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, '79P9aEuZpNpqqD+ndQTYfaeE+aI='
  register Sinatra::Flash

  get '/' do
    Peep.new
    @peeps = Peep.all
    @peeps.reverse!
    erb(:index)
  end

  get '/sessions/end' do
    erb(:'sessions/end')
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users/new' do
    @user = User.new
    @user.attributes = {
      name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    }
    if @user.save
      session[:user_id] = @user.id
      redirect '/users'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  get '/users' do
    Peep.new
    @peeps = Peep.all
    @peeps.reverse!
    redirect '/' if session[:user_id].nil?
    erb(:users)
  end

  post '/post' do
    time = Time.now.asctime
    user = current_user
    peep = Peep.create(message: params[:peep], time: time)
    user.peeps << peep
    user.save
    redirect '/users'
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/users')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:'sessions/new')
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/sessions/end'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run if app_file == $PROGRAM_NAME
end
