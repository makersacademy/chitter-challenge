require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  get '/users/new' do 
    erb:'users/new'
  end

  post '/users' do 
    user = User.create(username: params[:username], handle: params[:handle], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id]) # Fetch the user from the database, using an ID stored in the session. This way, we avoid storing the entire user in the session (partly because the session is v small and can't store much data)
    @peeps = Peep.sort_all_peeps 
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do 
    Peep.add(content: params[:peep], user: params[:user], handle: params[:handle])
    redirect '/peeps' 
  end
 
  run! if app_file == $0
end