# Controller for the web app. Each page is controlled by it's own GET / POST
# block below

require 'sinatra/base'
require './db/database_connection.rb'
require './db/access_database.rb'
require './lib/wall.rb'

class Chitter < Sinatra::Base

  # enable :sessions  #Enables use of session[:hash] for storing data

  get '/' do
    @posts = Wall.return_all
    erb :index
  end

  run! if app_file == $0

end
