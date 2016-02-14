ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect to '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create( username: params[:username],
                        email:    params[:email],
                        name:     params[:name])
                        # password: params[:password]
    session[:user_id] = user.id
    redirect to '/peeps'
  end

  run! if app_file == $0
end
