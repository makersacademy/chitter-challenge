# file: app.rb
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository.rb'
require_relative 'lib/user_repository.rb'

DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository.rb'
    also_reload 'lib/user_repository.rb'
  end

  get '/' do 
    return erb(:index)
  end

end 
