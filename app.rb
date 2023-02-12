require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = PeepRepository.new
    userrepo = UserRepository.new
    @peeps = repo.all
    @users = userrepo.all
    return erb(:peeps)
  end  

  get '/signup' do
    repo = UserRepository.new
    @users = repo.all
    return erb(:signup)
  end 
  
  post '/signup' do
    repo = UserRepository.new
    new_user = User.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]

    repo.create(new_user)

    return erb(:signedup)
  end  

  get '/newpeep' do
    repo = PeepRepository.new
    peeps = repo.all
    return erb(:newpeep)
  end  

  post '/newpeep' do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.time = Time.now
    userrepo = UserRepository.new
    new_user = Peep.new
    new_user = params[:name]
    new_user = params[:username]

    redirect to '/'    
  end  
end