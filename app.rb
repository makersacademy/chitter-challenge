require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/chitter_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/chitter_repository'
  end

  # This route simply returns a homepage containing links to the other pages 
  get '/' do
    @current_user = session[:user_username]

    return erb(:index)
  end

  post '/' do
    session[:user_username] = nil
    return erb(:index)
  end

  # An about page, yet to be populated
  get '/about' do
    
    return erb(:about)
  end

  # rturns a page containing all posted chitters
  get '/chitters' do
    repo = ChitterRepository.new
    @chitters = repo.all

    return erb(:chitters)
  end

  # This route processes the data input when a new chitter from has been submitted
  post '/chitters' do
    repo = ChitterRepository.new
    chitter = Chitter.new

    chitter.peep = params[:peep]
    chitter.created_at = Time.now
    repo.create(chitter)

    @new_chitter = params[:peep]

    return erb(:chitter_created)
  end

  # This route simply returns the new chitter form page (only accessible when logged in)
  get '/chitters/new' do
    return erb(:new_chitter)
  end
  
  # gets a list of all users
  get '/users' do
    repo = UserRepository.new
    @users = repo.all

    return erb(:users)
  end

  # This route simply returns the create user page which contains a sign-up form
  get '/sign-up' do
    return erb(:new_user)
  end

  # This route processes the info submitted through the create user form
  post '/sign-up' do
    repo = UserRepository.new
    user = User.new

    user.email = params[:email]
    user.password = params[:password]
    user.name = params[:name]
    user.username = params[:username]
    repo.create(user)

    @new_user = params[:username]

    return erb(:user_created)
  end

  # This route simply returns the login page
  get '/log-in' do
    return erb(:log_in)
  end

  # processes the data from a login form and matches it to a current user
  post '/log-in' do
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new

    user = repo.find_by_email(email)

    return erb(:login_error) unless user.password == password
    session[:user_username] = user.username
    return erb(:login_success)

  end
end
