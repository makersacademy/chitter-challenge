require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './lib/user'
require './lib/peeps'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    'hello'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/peeps' do
    User.create(username: params[:username],password: params[:password])
    session[:user_id] = User.find_by_username(params[:username]).user_id
    redirect '/peeps'
  end

  get '/peeps' do
    @session_id = session[:user_id]
    @all_peeps = Peeps.all

    erb :'peeps/pindex'
  end

  get '/peeps/new' do
    erb :'peeps/pnew'
  end

  post '/peeps/post' do
    Peeps.create(user_id: session[:user_id], peep: params[:peep_text])
    redirect '/peeps'
  end

end