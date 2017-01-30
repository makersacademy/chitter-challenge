ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
    @current_user = User.get(session[:user_id])
    end
  end

  get '/' do
    @peeps = Peep.all(:order => [ :created_timedate.desc ])
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], user_name: params[:user_name],email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.id == nil
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    else
      session[:user_id] = @user.id
      redirect '/'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name],params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = ['Incorrect nickname or password. Try again.']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
      session[:user_id] = nil
      redirect '/'
  end

  post '/peeps' do
    # current_user = User.get(session[:user_id])
    peep = Peep.create(content: params[:new_peep], user_id: current_user.id, created_timedate: Time.now)
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
