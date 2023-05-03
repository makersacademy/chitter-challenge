require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './controllers/peeps_controller'
require './controllers/user_controller'

# Connect to the chitter_database
DatabaseConnection.connect('chitter_database')

# Instantiate repositories
peeps_repo = PeepsRepository.new(DatabaseConnection)
user_repo = UserRepository.new

class Application < Sinatra::Base
  configure do
    set :views, './views'
    set :public_dir, './public'
    enable :sessions
  end

#   # Inject repositories into controllers
  use SignupController
  use PeepsController
end
