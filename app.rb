require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './controllers/peeps_controller'
require './controllers/user_controller'

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
        set :public_folder, 'public'
        set :views, 'views'
        use SignupController
        use PeepsController
    end
end
