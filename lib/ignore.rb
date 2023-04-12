# repeating app.rb so I understand it all

require 'sinatra'
require 'sinatra/reloader'
# automatically reload app when change detected
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require 'date'

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
# ^ makes a new class 'Application' that inherits from the Sinatra::Base
# Base is main class for web application building with the Sinatra web framework
# Allows us to define routes, configure settings, and add extensions
  configue :development do
    # sets Sinatra configuration to development environment
    register Sinatra::Reloader
  end

  enable: sessions 
  # Store user data for a specific session

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
    # Above need to make a new peep repository to show all peeps to users
    # Instance variable for the erb file to access

    if session[:email_address]
        # above checks if user prev logged in, if they were, the email is stored
        # on the session, if not then the email is not stored on the session
        # @user instance variable pulls our the user based on finding by email address
        # This allows us to access all the elements of the user
        @user = UserRepository.new.find_by_email(session[:email_address])
        return erb(:homepage)
    else
        return erb(:homepage)
    end
  end

  get '/register' do
      return erb(:register)
  end

  post '/register' do
    if !params[:email_address].include?('@') || 
        status 400
        return ''
    end # In view we have a minlength reference, so dont need to worry about nil

    repo = UserRepository.new
    user = User.new
    user.email_address = params['email_address']
    user.username = params['username']
    user.password = params['password']
    repo.create(user)

    redirect '/'
    end

  get '/login' do
      return erb(:login)
  end

  post '/login' do
    email_address = params[email_address]
    password = params[password]

    user = UserRepository.new(find_by_email(email_address))
    # Above assigns a user variable to a new user repo with 
    # find_by_email, and this finds the user based on email_address

    if user && user.password == password
      # if user means if the user is true from line 71 (it exists)
      # user.password == password checks the password with decrypt matches
      # session[email_address] is created based on user.email_address
      session[:email_address] = user.email_address

      peep_repo = PeepRepository.new
      @peeps = peep_repo.all
      # peep repo needs to be done for every route as it doesn't save per route
      @user = user # create this as an instance variable
      erb(:homepage)
    else
      @error = true # error message defined in login page
      erb(:login)
    end

    get 'logout' do
      session.clear # clears the user session
      redirect '/'
    end

    get '/new_peep' do
      return erb(:new_peep)
    end

    post '/new_peep' do
      contents = params[:contents]
    
      if session[:email_address]
          @user = UserRepository.new.find_by_email(session[:email_address])
      end

      peep_repo = PeepRepository.new

      new_peep = Peep.new
      new_peep.contents = contents
      new_peep.time = Time.now.strftime("%d/%m/%Y %H:%M")
      new_peep.user_id = @user.id

      peep_repo.create_peep(new_peep)
      @peeps = peep_repo.all
      # Above first is making a new peep based on contents submitted on
      # new_peep erb, then relaying all the peeps, maybe i dont have to do this

      return erb(:homepage)
    end
end