require_relative 'lib/database_connection'
require_relative 'lib/user_repository.rb'
require_relative 'lib/peep_repository.rb'
require 'sinatra/base'
require 'sinatra/reloader'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base 
  # Sessions are disabled by default, so this line is needed.
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    new_user = User.new
    new_user.username = params['username']
    new_user.email = params['email']
    new_user.password = params['password']
    created_user = UserRepository.new.create(new_user)
    session[:user_id] = created_user.id
    redirect '/homepage'
  end

  get '/homepage' do
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:homepage)
  end

  get '/peep' do
    return erb(:peep)
  end

  post '/peep' do
    new_peep = Peep.new
    new_peep.peep = params[:peep]
    new_peep.timestamp = Time.now
    new_peep.username_id = session[:user_id] 
    PeepRepository.new.create(new_peep)
    redirect '/homepage'
  end  
end

