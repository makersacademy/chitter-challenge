require 'sinatra/base'
require './db_setup'
require './lib/peep'
require 'date'
require './lib/peeper'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello world"
    redirect '/home'
  end

  get '/home' do
    @peeps = Peep.all
    @peeper = session[:peeper] 
    erb :'chitter/home'
  end

  post '/create' do
    redirect '/add'
  end

  get '/add' do
    erb :'chitter/add'
  end

  post '/add' do
    @peep = Peep.create(params[:message], Time.now)
    "You Peeped"
    redirect '/home'
  end

  post '/MainLogin' do
    redirect '/login'
  end

  get '/login' do
    erb :'chitter/login'
  end

  post '/login' do
    session[:peeper] = Peeper.get(params[:username])
    p params[:username]
    redirect '/home'
  end

  post '/MainSignup' do
    redirect '/signup'
  end

  get '/signup' do
    erb :'chitter/signup'
  end

  post '/signup' do
    @newpeeper = Peeper.create(params[:name], params[:email], params[:username], params[:password])
    p @peeper
    redirect '/login'
  end

end