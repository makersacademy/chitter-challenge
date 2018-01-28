ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rake'
require 'securerandom'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  # server config
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  register Sinatra::Flash
  use Rack::MethodOverride

  # start the server if ruby file executed directly
  run! if app_file == $0

  # helper methods
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
   end

  #  routes
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    redirect '/sessions/new' unless current_user
    erb :'peeps/add_peep'
  end

  post '/peeps' do
    @peep = Peep.create(body: params[:body], user_id: current_user.id)
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/add_user'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password], 
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/add_user'
    end
  end

  get '/sessions/new' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.first(params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/peeps'
    else 
      flash.now[:notice] = "The email or password is incorrect"
      erb :'sessions/login'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect '/peeps'
  end

end