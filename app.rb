require './lib/database_connection'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep_repository'
require './lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

end