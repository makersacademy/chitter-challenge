require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all_with_user

    return erb(:index)
  end

  get '/peeps/new' do
    return erb(:create_peep)
  end
end
