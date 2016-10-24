ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './models/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect 'users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(user_name: params[:user_name],
    name: params[:name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/peeps' do
    erb :'/welcome'
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
    redirect to '/sessions/new'
  end

  get '/index' do
    @peeps = Peep.all
    erb :index
  end

  post '/index' do
    peep = Peep.create(post: params[:post], created_at: Time.new, user: current_user)
    peep.save
    redirect '/index'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
