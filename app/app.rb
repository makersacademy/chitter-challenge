require 'sinatra/base'
require 'sinatra/reloader'
# setup the connection
require './database_connection_setup'
# require the classes
require './lib/database_connection'
require './lib/peep'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :main
  end

  get '/home' do
    @peeps = Peep.all
    erb :'peeps/home'
  end

  get '/home/new' do
    erb :'peeps/new'
  end

  post '/home/new' do
    Peep.create(body: params[:body])
    redirect '/home'
  end

end
