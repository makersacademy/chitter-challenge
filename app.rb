require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peeps'

class Chitter < Sinatra::Base
  #configure :development do
   # register Sinatra::Reloader
  #end
  
  get '/' do
    'Chitter'
  end

  get '/chitter' do
    @peeps = Peeps.all
    erb :peeps

  end

  run! if app_file == $0
end