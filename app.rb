require 'sinatra/base'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require 'user_repository'
require 'user'
require 'bcrypt'

DatabaseConnection.connect

enable :sessions

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

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

    user = UserRepository.find_by_email(email)
    user.sign_in(user.email, user.password)
    # This is a simplified way of 
    # checking the password. In a real 
    # project, you should encrypt the password
    # stored in the database.
    if user.password == password
      # Set the user ID in session
      session[:user_id] = user.id

      return erb(:login_success)
    else
      return erb(:login_error)
    end
  end

  # This route is an example
  # of a "authenticated-only" route.
  # It can be accessed only if a user is
  # signed-in (if we have user information in session).
  get '/account_page' do
    if session[:user_id] == nil
      # No user id in the session
      # so the user is not logged in.
      return redirect('/login')
    else
      # The user is logged in, display 
      # their account page.
      return erb(:account)
    end
  end

end