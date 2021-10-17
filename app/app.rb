require 'sinatra/base'
require 'sinatra/reloader'
# setup the connection
require './database_connection_setup'
# require the classes
require './lib/database_connection'
require './lib/peep'
require './lib/user'
require './lib/authenticate'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :main
  end

  get '/register' do
    erb :'signing_in/register'
  end

  post '/register' do
    User.create(username: params[:username], password: params[:password])
    redirect '/login'
  end

  get '/login' do
    erb :'signing_in/login'
  end

  post '/login' do
    session[:user] = params[:username]
    if authenticate(username: params[:username], password: params[:password])['exists'] == "t"
      redirect '/home'
    else
      redirect '/login'
    end
  end

  get '/home' do
    if session[:user] == nil
      redirect '/login'
    else
      @user = session[:user]
      @peeps = Peep.all
      erb :'peeps/home'
    end
  end

  get '/home/new' do
    erb :'peeps/new'
  end

  post '/home/new' do
    Peep.create(body: params[:body])
    redirect '/home'
  end

end
