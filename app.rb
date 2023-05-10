require 'sinatra/base'
require 'sinatra/reloader'
require 'date'
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
    @peeps_list = PeepRepository.new.all
    @users = UserRepository.new

    return erb(:index)
  end

  get '/peeps/new' do
    return erb(:new_peep)
  end

  post '/peeps' do
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.time = Time.now
    new_peep.user_id = '1'

    PeepRepository.new.create(new_peep)

    return erb(:peep_posted)
  end

  get '/signup' do
    return 
  end

end
