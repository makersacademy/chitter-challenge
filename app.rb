require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './controllers/peeps_controller'
require './controllers/user_controller'
require './lib/peeps_repository'

# Connect to the chitter_database
DatabaseConnection.connect('chitter_database')


class Application < Sinatra::Base
  configure do
    enable :sessions
    set :views, File.join(__dir__, 'views')
    set :public_dir, './public'

    # Instantiate repositories
    @@user_repo = UserRepository.new
    @@peeps_repo = PeepsRepository.new(@@user_repo)
  end

  use SignupController
  use PeepsController

  def self.peeps_repo
    @@peeps_repo
  end

  def self.user_repo
    @@user_repo
  end
end

