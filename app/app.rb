ENV["RACK_ENV"] ||= "development"

require_relative 'views/data_mapper_setup'
require './app/models/user'
require './app/models/peep'
require 'sinatra/base'
require 'data_mapper'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'yes'

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/users/new' do
    erb(:signup)
  end

  post '/users' do
    user = User.create(email: params[:email],
                        password: params[:password],
                        name: params[:name],
                        username: params[:username])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/peep' do
    peep = Peep.create(content: params[:peep])
    redirect '/'
  end

  # get '/signin' do
  #   erb(:'links/signin')
  # end
  #
  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  run! if app_file == $0
end
