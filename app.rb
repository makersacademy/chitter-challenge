require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @peep_list = peep_repo.all
    return erb(:index)
  end

  post '/' do
    repo = PeepRepository.new
    @user_repo = UserRepository.new
    peep = Peep.new
    peep.title = params[:title]
    peep.content = params[:content]
    peep.time_stamp = Time.new
    peep.user_id = 1
    repo.create(peep)
    @peep_list = repo.all
    return erb(:index)
  end
end

