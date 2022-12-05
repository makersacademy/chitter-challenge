# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/user'

require 'date'


DatabaseConnection.connect

class Application < Sinatra::Base
  # Sessions are disabled by default, so this line is needed.
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    new_user = User.new
    new_user.email = params[:email]
    new_user.password = params[:password]
    repo = UserRepository.new
    repo.create(new_user)
    return redirect('/login')
    # return 'hey you have signed up successfully'
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
    repo = UserRepository.new
    if repo.sign_in(params[:email], params[:password]) == true
      user = repo.find_by_email(params[:email])
      session[:user_id] = user.id
      # return 'You have signed in successfully'
      return redirect ('/')
    else
      # return 'Log in unsuccessful'
      return redirect ('/login')
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
      @user = session[:user_id]
      return erb(:account)
    end
  end


  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
    @user = session[:user_id]

    return erb(:index)
  end


  post '/' do
    if session[:user_id] == nil
      # No user id in the session
      # so the user is not logged in.
      return redirect('/login')
    else
      # The user is logged in, display
      # their account page.
      @user = session[:user_id]
      repo = PeepRepository.new
      @peeps = repo.all
      current_time = DateTime.now
      current_time = current_time.strftime "%Y-%m-%d %H:%M:%S"
      repo = PeepRepository.new

      new_peep = Peep.new
      new_peep.content = params[:content]
      new_peep.time = current_time

      repo.create(new_peep)
      redirect('/')
    end
  end

end
