# Controller for the web app. Each page is controlled by it's own GET / POST
# block below

require 'sinatra/base'
require './db/database_connection.rb'
require './db/access_database.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  DatabaseConnection.setup('chitter')

  enable :sessions  #Enables use of session[:hash] for storing data

  get '/' do
    erb :index
  end

  get '/show-db' do
    @database = AccessDatabase.get_all('peeps')
    @dataline = AccessDatabase.get_line('peeps', 1)
    erb :show_db
  end

  run! if app_file == $0

end
