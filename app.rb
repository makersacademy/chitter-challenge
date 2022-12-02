require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/comment_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do    
    peep_repo = PeepRepository.new
    peeps = peep_repo.all
    @reversed_peeps = peeps.reverse

    @user_repo = UserRepository.new

    return erb(:index)
  end

  get '/login' do
    

  end




  # def check_login
  #   @logged_in = false

  # end
end