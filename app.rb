require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/database_connection'
require 'json'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/peeps' do
    peeps_repo = PeepRepository.new
    @peeps = peeps_repo.all
    users_repo = UserRepository.new
    @users = users_repo.all
    return erb(:peeps)
  end

  get '/peeps/new' do
    return erb(:new_peep)
  end

  post '/peeps' do
    content = params[:content]
    peep_time = Time.now.getutc
    user_id = 1

    if content.length == 0
       status 400
       return 'ERROR: Contents field must be filled'
    end

    new_peep = Peep.new
    new_peep.content = content
    new_peep.peep_time = peep_time
    new_peep.user_id = user_id
    PeepRepository.new.create(new_peep)

    return erb(:peep_posted)
  end
end
