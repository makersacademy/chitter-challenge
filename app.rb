require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './db/queries/pg_connect'
# require_relative './db/queries/pg_db'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  DB.connect

  get '/' do
    erb :index
  end

  get '/chitter' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :chitter
  end

  get '/chitter/add' do
    erb :add
  end

  post '/chitter' do
    Peep.add(post: params['peep_text'])
    redirect '/chitter'
  end

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/chitter'
  end

  run! if app_file == $0
end
