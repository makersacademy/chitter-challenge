require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require 'sinatra/flash'

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
  
    if session[:user_id]
      # user is logged in
      @user = UserRepository.new.find(session[:user_id])
      return erb(:homepage, locals: { logged_in: true })
    else
      # user is not logged in
      return erb(:homepage, locals: { logged_in: false })
    end
  end  

  get '/register' do
    return erb(:register)
  end

  post '/register' do # once user has registered
    if params[:email_address].nil? || !params[:email_address].include?('@') || params[:username].nil? || params[:password].nil?
      status 400
      return ''
    end

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
    email_address = params[:email_address]
    password = params[:password]

    repo = UserRepository.new
    user = repo.find_by_email(email_address)

    if user && user.password == password
      session[:user_id] = user.id

      redirect '/'
    else
      @error = true
      return erb(:login)
    end
  end
end
