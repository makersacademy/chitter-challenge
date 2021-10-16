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
    Peep.create(body: "Test Peep Please Ignore")
    Peep.create(body: "Another Test Peep")
    Peep.create(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")
    @peeps = Peep.all
    erb :'peeps/home'
  end

end
