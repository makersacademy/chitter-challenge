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

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    puts "params[:user]: #{params[:new_user]}"
    result = DatabaseConnection.query(
      "SELECT * from users WHERE peeper = $1",
      [params[:new_user]]
    )
    puts "result cmdtuples: #{result.cmdtuples}"
    if result.cmdtuples == 0
      signup = DatabaseConnection.query(
        "INSERT INTO users (peeper) VALUES ($1) RETURNING id, peeper;",
        [params[:new_user]]
      )
      $user_id = signup[0]['id']
      $peeper = signup[0]['peeper']
    end
    puts $user_id
    redirect ('/signup_success')
  end

  get '/signup_success' do
    puts "@user_id at signup_success #{$user_id}"
    @user_id = $user_id
    @peeper = $peeper
    erb :signup_success
  end

  post '/mypeeps' do
    DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES ($1, $2, current_timestamp)",
      [params[:new_peep], 'DEV_TESTING']
    )
    redirect ('/mypeeps')
  end

  get '/mypeeps' do
    # DatabaseConnection.setup('chitter_test')
    @result = Peeps.show_mine
    erb :'/peeps/mypeeps'
  end

  get '/viewpeeps' do
    # DatabaseConnection.setup('chitter_test')
    @result = Peeps.show_all
    erb :'/peeps/allpeeps'
  end
 
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
 