require 'sinatra/base'
require './app/models/peep'
require './app/models/user'
require './app/models/db_connection'

class Chitter < Sinatra::Base

  get '/' do
    ENV['RAILS_ENV'] = 'development' if ENV['RAILS_ENV'] != 'test'
    @peeps = Peep.all
    erb :index
  end

 DatabaseConnection.setup

end
