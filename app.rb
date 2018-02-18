require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    #3. get peeps from database and post them here-
    #   maybe add a time/date to each peep

    erb(:index)
  end

  post '/peep' do
    #1. Connect to database

    #2. Query the database with Insert sql

    redirect('/')
  end

  run! if app_file == $0

end


# Add these classes to a module 
