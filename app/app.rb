require 'sinatra/base'
require 'sinatra/reloader'
require './app/models/peep.rb'
require './app/models/user.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
   redirect '/peeps'
  end

  get '/peeps' do
    #Fetch the user from the database, using an ID stored in the session
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(content: params['message'])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
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

  run if app_file == $0

end