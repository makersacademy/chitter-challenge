require 'sinatra'
require 'pg'
require_relative './lib/database_connection'

DatabaseConnection.connect('chitter')

class Application
  def initialize
    #
  end
end
