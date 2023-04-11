require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require 'erb'

DatabaseConnection.connect('chitter_database_test')

enable :sessions

class Application < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  def user_exist?
    user = UserRepository.new
    return true if !user.email_unique?(params[:email]) || !user.username_unique?(params[:username])
    return false
  end

  def invalid_inputs?(name, email, username, password)
    return true if name.nil?
    return true unless email.match? "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
    return true unless username.match? "[A-Za-z0-9_.-]{3,20}"
    return true unless password.match? "(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
    return false
  end

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all_reversed
    return erb(:homepage)
  end

  post '/post' do
    repo = PeepRepository.new
    new_peep = Peep.new

    user_input = params[:message]
    escaped_input = ERB::Util.html_escape(user_input)
    new_peep.message = escaped_input

    new_peep.time = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    repo.create(new_peep)

    return redirect('/')

  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    # call methods to validate request parameters
    if user_exist?
      session[:user_exists] = true
      @message = 'email address or username already exists, try again.'
      return erb(:signup)
    end
    
    if invalid_inputs?(params[:name], params[:email], params[:username], params[:password])
      session[:invalid_inputs] = true
      @message1 = 'Make sure Email Address is valid'
      @message2 = 'Make sure Username is at least three characters long'
      @message3 = 'Make sure Password is at least eight characters long'
      return erb(:signup)
    end

    repo = UserRepository.new
    new_user = User.new

    new_user.name = params[:name]
    new_user.email = params[:email]
    new_user.username = params[:username]
    new_user.password = params[:password]

    repo.create(new_user)

    return redirect('/')
  end

  get '/login' do
    return erb(:login)
  end

end
