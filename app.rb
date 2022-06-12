# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peeps'
require './lib/database_connection_setup'
require './lib/users'
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
    puts "Users.username_available(params[:new_user]): #{Users.username_available(params[:new_user])}"
    if Users.username_available(params[:new_user])
      $user = Users.signup(params[:new_user])
      puts "$user id: #{$user.id}"
      redirect ('/signup_success') 
    end
  end

  get '/signup_success' do
    puts "redirect successful"
    @user = $user
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
    @result = Peeps.show_mine
    erb :'/peeps/mypeeps'
  end

  get '/viewpeeps' do
    @result = Peeps.show_all
    erb :'/peeps/allpeeps'
  end
 
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
 