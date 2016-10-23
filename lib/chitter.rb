ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative '../models/database_initializer'
require_relative '../models/user'

class Chitter < Sinatra::Base

  database_setup

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    # user email stored here
    # user password stored here
    # user username stored here
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

=begin
Monday night steps:
Create database for storing username, password hash, email.
Add functionality for password hashing and salting
Add functionality for password retrieval
Add 'logged in' status
Add ability to log out
Make a page that can only be accessed when you are logged in.
=end
