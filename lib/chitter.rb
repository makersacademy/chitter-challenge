ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative '../models/database_initializer'
require_relative '../models/user'
require 'bcrypt'

class Chitter < Sinatra::Base

  include BCrypt

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

  enable :sessions
set :session_secret, 'super secret'

  database_setup

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(username_db: params[:username],
                email_db: params[:email],
                password_db: BCrypt::Password.create(params[:password]))
    session[:username] = user.username
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    # @user = User.find_by_email(params[:email_2])
    # p @user
    # p @user.password
    if params[:password_2] == @current_user.password
      erb :success
    else
      erb :fail
    end


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
