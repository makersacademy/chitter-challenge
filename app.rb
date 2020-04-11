require 'sinatra/base'
require './db_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    "Hello world"
  end

  get '/home' do
    erb :'chitter/home'
  end

  get '/add' do
    erb :'chitter/add'
  end

  post '/add' do
    @peep = Peep.create(params[:message])
    "You Peeped"
    redirect '/home'
  end

end