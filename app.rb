require 'sinatra/base'
require 'sinatra/reloader'

require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = DatabaseConnection.query("SELECT * FROM Users;")
    @peep = DatabaseConnection.query("SELECT content FROM Peeps;")
    erb :index
  end

  run! if app_file == $0
end
