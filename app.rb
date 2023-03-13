require './lib/database_connection'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep_repository'
require './lib/user_repository'
require './lib/peep_model'
require './lib/user_model'

DatabaseConnection.connect('chitterdb_test')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepRepository.new
    @public_peeps = repo.all
    return erb(:index)
  end

end