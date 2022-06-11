# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peeps'
require './lib/database_connection_setup'
# as the connection setup is required here,
# the connection will be set accordingly when app.rb is started

class Chitter < Sinatra::Base
  configure :development do
  register Sinatra::Reloader
  end

  enable :sessions

  # our routes would go here
  get '/' do
    erb :index
  end

  post '/mypeeps' do
    puts params[:new_peep]
    connection = PG.connect(dbname: 'chitter_test')
    DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES ($1, $2, current_timestamp)",
      [params[:new_peep], 'DEV_TESTING']
    )
    redirect ('/mypeeps')
  end

  get '/mypeeps' do
    @result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE peeper = $1 ORDER BY post_time DESC",
      ['DEV_TESTING']
    )
    erb :'/peeps/mypeeps'
  end
 
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
 