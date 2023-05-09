require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/account_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/account_repository'
  end

  get '/' do
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all

    return erb(:homepage)
  end
end
