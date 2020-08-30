require 'sinatra/base'
require './lib/peep'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.peeps
    erb :index
  end

  run! if app_file == $0
end
