require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_site_test')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
    p @peeps

    return erb(:home)
  end

  # returns an array of the authors
  # of peeps given an array of the peeps
  def author(peep)
    repo = UserRepository.new
    id = peep.user_id
    user = repo.find(id)
    return { name: user.name, username: user.username }
  end
end
