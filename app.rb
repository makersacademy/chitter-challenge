require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

require './database_connection_setup'

require_relative './lib/peep'
require_relative './lib/user'
# require 'sinatra/activerecord'

# set :database_file, '/config/database.yml'

class Chitter < Sinatra::Base
  # register Sinatra::ActiveRecordExtension

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    @peeps_sorted = @peeps.sort_by { |peep| peep.time_created }.reverse
    erb :"/peeps/index"
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to '/peeps'
  end

  get '/peeps/new' do
    erb(:"/peeps/new")
  end

  get '/users/new' do
    erb(:"/users/new")
  end

  post '/users' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
