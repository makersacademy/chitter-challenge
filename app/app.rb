ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'users/new'
  end

  get '/chitter' do
    erb :'peeps/signin'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  post '/peeps' do
   time = Time.now
   Peep.create(
     peep: params[:peep],
     time: time,
     user: current_user
   )
   redirect to('/peeps')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/chitter'
    else
      redirect '/users/new'
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
