require 'sinatra/base'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = chitter.peeps
    erb :index
  end

  run! if app_file == $0
end
