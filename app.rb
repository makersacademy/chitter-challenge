require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/maker_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/maker_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    return erb(:index)
  end
  
end