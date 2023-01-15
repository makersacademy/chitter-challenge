require_relative 'lib/database_connection'
require 'sinatra/base'
require 'sinatra/reloader'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end
end