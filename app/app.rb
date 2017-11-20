ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'bcrypt'

require './app/data_mapper_setup'


class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end


  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    user = User.get(session[:user_id])
    user.peeps << Peep.first_or_create(mess: params[:mess], created_at: Time.now)
    user.save
    redirect '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/peeps'
  end

end
