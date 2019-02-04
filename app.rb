require 'sinatra/base'
require 'shotgun'
require 'pg'
require './database_connection_setup'
require './lib/user.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base

enable :sessions, :method_override

  get '/' do
    erb :'home/index'
  end

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])

    redirect '/users'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    @username = session[:username]
    p @username
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(username: params[:username], peep: params[:peep])
    redirect '/peeps'
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    user = User.authenticate(username: params[:username], password: params[:password])
    session[:username] = user.username
    # $username = params[:username]
    # $password = params[:password]
    redirect '/peeps/new'
  end

  run! if app_file == $0

end
