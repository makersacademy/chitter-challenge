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

  $logged_in = false
  $log_in_name = nil

  # our routes would go here
  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    puts "Users.username_available(params[:new_user]): #{Users.username_available(params[:new_user])}"
    if Users.username_available(params[:new_user])
      $user = Users.signup(params[:new_user])
      redirect ('/signup_success') 
    end
  end

  get '/signup_success' do
    @user = $user
    erb :signup_success
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    redirect ('/log_in') unless Users.username_available(params[:username]) == false
    $log_in_name = params[:username]
    $logged_in = true
    redirect ('/mypeeps')
  end

  post '/mypeeps' do
    @log_in_name = $log_in_name
    puts "post /mypeeps @log_in_name: #{@log_in_name}"
    DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES ($1, $2, current_timestamp)",
      [params[:new_peep], @log_in_name]
    )
    redirect ('/mypeeps')
  end

  get '/mypeeps' do
    # if @logged_in == false
    #   redirect ('/log_in')
    # else
    @log_in_name = $log_in_name
      # puts "/mypeeps @log_in_name: #{@log_in_name}"
      @result = Peeps.show_mine(@log_in_name)
      erb :'/peeps/mypeeps'
    # end
  end

  get '/viewpeeps' do
    @result = Peeps.show_all
    erb :'/peeps/allpeeps'
  end
 
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
 