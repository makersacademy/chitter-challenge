
ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterChatter < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'
  get '/' do
    'Hello ChitterChatter!'
    redirect to('/users/new')
  end

  get '/users/new' do
    user = User.new
    erb :'users/new'
  end
  post '/users' do
    user = User.create(email: params[:email], password: params[:password])

    session[:user_id] = user.id
    redirect to('/chits')
  end
  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end


  get '/chits' do
    erb :'chits/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
