require 'sinatra/base'
require 'sinatra/reloader'

require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Oh hey chitter!'
  end

  run! if app_file == $0
end
