require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/chitter_repository'

DatabaseConnection.connect

class Application < Sinatra::Base 
    
    configure :development do
        register Sinatra::Reloader
        also_reload 'lib/user_repository'
        also_reload 'lib_chitter_repository'
    end
    get '/' do
       
        return erb(:index)
    end

end