ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative '../models/database_initializer'
require_relative '../models/user'
require 'bcrypt'

class Chitter < Sinatra::Base

  include BCrypt

  # enable :sessions
  # set :session_secret, 'super secret'

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
    # session[:user_id] = user.id
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.first(email_db: params[:email_2])
    if BCrypt::Password.new(@user.password_db) == params[:password_2]
      erb :success
    else
      erb :fail
    end
    # Zoo.first(:name => 'Metro')
    # p @user
    # p @user.password_db
    # p BCrypt::Password.new(@user.password_db)
    # p params[:password_2]
    # p BCrypt::Password.create(params[:password_2])
    # if BCrypt::Password.create(params[:password_2]) == @user.password_db



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
