require 'sinatra/base'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require './lib/peep'
require './lib/user'
require './lib/peep_repository'
require './lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user.rb'
    also_reload 'lib/peep.rb'
    also_reload 'lib/peep_repository.rb'
    also_reload 'lib/user_repository.rb'
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/users' do
    repo = UserRepository.new
    new_user = User.new
    new_user.email = params[:email]
    new_user.password = params[:password]
    repo.create(new_user)
    redirect '/login'
  end
  
  # This route simply returns the login page
  get '/login' do
    return erb(:login)
  end
  
    # This route receives login information (email and password)
    # as body parameters, and find the user in the database
    # using the email. If the password matches, it returns
    # a success page.
  post '/login' do
    email = params[:email]
    password = params[:password]
    user = UserRepository.new
      # This is a simplified way of 
      # checking the password. In a real 
      # project, you should encrypt the password
      # stored in the database.
      if user.sign_in(email, password) == true
        # Set the user ID in session
        session[:id] = user.find(email).id
        return erb(:account)
      else
        return error
      end
    end
  
    # This route is an example
    # of a "authenticated-only" route.
    # It can be accessed only if a user is
    # signed-in (if we have user information in session).
  get '/account_page' do
    if session[:id] == nil
        # No user id in the session
        # so the user is not logged in.
      return redirect('/login')
    else
        # The user is logged in, display 
        # their account page.
      return erb(:account)
    end
  end

  post '/account_page/peeps' do
    if invalid_request_parameters?
      status 400
      return ''
    end
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.message = params[:message]
    new_peep.tag = params[:tag]
    new_peep.created_at = params[:created_at]
    repo.create(new_peep)
  end

  get '/account_page/peeps' do
    @peeps = PeepRepository.new.all
    return erb(:peeps)
  end

  def invalid_request_parameters?
    return (params[:message] == nil)
  end
end
