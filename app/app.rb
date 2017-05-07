require 'sinatra/base'

require_relative 'controllers/users'
require_relative 'models/user'

ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  post '/users' do
    @user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                confirm_password: params[:confirm_password])
    session[:user_id] = user.id
    erb(:'users/welcome')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb(:'users/new')
  end

  get '/login' do
    erb(:login)
  end
end
