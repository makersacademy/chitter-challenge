require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/account_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end