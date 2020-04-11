require 'sinatra/base'
require './db_setup'
require './lib/peep'
require 'date'

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

  get '/login' do
    erb :'chitter/login'
  end

  post '/login' do
    session[:peeper] = params[:username]
    redirect '/home'
  end

end