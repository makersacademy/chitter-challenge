require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    peep_repo = PeepRepository.new ; user_repo = UserRepository.new
    @peeps = peep_repo.all_peeps ; users = user_repo.all_users

    @name = [] ; @username = []

    users.each do |record|
      @name << record.name ; @username << record.username
    end
    return erb(:index)
  end

  get '/peep/:id' do
    peep_id = params[:id]
    peep_repo = PeepRepository.new
    peep = peep_repo.find_peep(peep_id)
    @content = peep.content; @datetime = peep.datetime.split
    user_id = peep.user_id

    user_repo = UserRepository.new
    user = user_repo.find_user(user_id)
    @name = user.name; @username = user.username
    return erb(:peep)
  end
end