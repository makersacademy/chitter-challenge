ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class ChitterChallenge < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @posts = Peep.all(order: :created_at.desc)
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitter' do
    user = User.get(session[:user_id])
    post = user.peeps.create(peep: params[:message], username: user.username)
    redirect '/chitter'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/homepage'
  end

  get '/homepage' do
    erb :'homepage'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if (@user)
      session[:user_id] = @user.id
      redirect '/homepage'
    else
      flash.now[:notices] = ["E-mail or password are incorrect."]
      erb :'sessions/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], username: params[:username], name: params[:name])
    if @user.save
      session[:user_id] = @user.id
      erb :'homepage'
    else
      flash.now[:notices] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
