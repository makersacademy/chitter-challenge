require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  
  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @user = User.find(session[:username])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:username] = user.username
    redirect '/peeps'
  end

  run! if app_file == $0
end
