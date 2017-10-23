ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message], time_posted: Time.now)
  redirect to '/peeps'
  end

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.create(name: params[:name], user_name: params[:user_name], password: params[:password])
    session[:user_id] = user.id
    redirect to '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    p params[:user_name]
    p params[:password]
    user = User.authenticate(user_name: params[:user_name], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      erb :'sessions/new'
    end
  end

end
