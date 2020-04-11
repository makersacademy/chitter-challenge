require 'sinatra/base'
require './db_setup'
require './lib/peep'
require 'date'

class Chitter < Sinatra::Base

  get '/' do
    "Hello world"
  end

  get '/home' do
    @peeps = Peep.all
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

end