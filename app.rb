require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/peeps' do 
    repo = PeepRepository.new 
    @peeps = repo.all
    return erb(:peeps)
  end

  get '/post_peep' do 
    return erb(:post_peep)
  end

  post '/peeps' do 
    repo = PeepRepository.new 
    post_peep = Peep.new 
    post_peep.message = params[:message]
    @time = Time.now
    post_peep.time_created = @time
    post_peep.user_id = params[:user_id]

    repo.create(post_peep)
    @peeps = repo.all
    return erb(:peeps)
    return erb(:post_peep)
  end
end
