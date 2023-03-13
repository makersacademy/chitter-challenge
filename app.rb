require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all

    user_repo = UserRepository.new
    @users = user_repo.all

    return erb(:index)
  end
end