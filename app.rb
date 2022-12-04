require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @users = UserRepository.new
    
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:home)
  end

  get '/new' do
    return erb(:new_post)
  end

  post '/new' do
    repo = UserRepository.new
    new_peep = Peep.new

    new_peep.message = params[:message]
    new_peep.time = Time.now
    new_peep.user_id = repo.find_by_name(params[:name]).id

    repo = PeepRepository.new
    repo.create(new_peep)

    return erb(:confirm_new_post)
  end
end
