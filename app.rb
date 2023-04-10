require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require 'date'

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    repo = PeepRepository.new
    @peeps = repo.all
  
    if session[:email_address]
      @user = UserRepository.new.find_by_email(session[:email_address])
      return erb(:homepage)
    else
      return erb(:homepage)
    end
  end  

  get '/register' do
    return erb(:register)
  end

  post '/register' do # once user has registered
    if !params[:email_address].include?('@')
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
  
    user = UserRepository.new.find_by_email(email_address)
  
    if user && user.password == password
      session[:email_address] = user.email_address
  
      peep_repo = PeepRepository.new
      @peeps = peep_repo.all
      @user = user
      erb(:homepage)
    else
      @error = true
      erb(:login)
    end
  end  

  get '/logout' do
    session.clear
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

    return erb(:homepage)
  end
end
