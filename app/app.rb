ENV['RACK_ENV'] ||= 'development'

require './app/models/database_config'
require 'sinatra/base'
require './app/models/peep.rb'
require './app/models/user.rb'
require 'bcrypt'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(maker: current_user.username, body: params[:new_peep], user_id: current_user.id)
    redirect '/peeps'
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.valid?
      redirect '/welcome'
    else
      redirect '/signup'
    end
  end

  get '/welcome' do
   erb(:welcome)
  end

  get '/msg' do
    erb(:msg)
  end

# Check if works without it
# run! if app_file == $0
end
