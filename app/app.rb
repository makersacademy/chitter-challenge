ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/new_user' do
    erb :user_new
  end

  post '/sign_up' do
    user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/links'
    else
    flash.now[:errors] = user.errors.full_messages
    erb :user_new
    end
 end

 get '/links' do
   erb :chitter
 end

 get '/sessions/new' do
   erb :'sessions/new'
 end

 post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/links')
  else
    flash.now[:errors] = user.errors.full_messages
    erb :'sessions/new'
  end
end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/links'
  end

  get '/peep_new' do
    erb :peep_new
  end

  get '/chitter' do
    erb :chitter
  end

  post '/chitter' do
    current_user
    if @current_user != nil
      peep = Peep.create(name: current_user.name, peep: params[:peep], time: Time.now)
      peep.save
      erb :chitter
      else
      flash.now[:notice] = ['You need to be signed in to post a peep']
      erb :index
    end
  end
 # start the server if ruby file executed directly
   run! if app_file == $0
end
