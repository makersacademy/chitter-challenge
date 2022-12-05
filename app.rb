require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do 
    repo = PeepRepository.new 
    user_repo = UserRepository.new 
    @peeps = repo.all 
    return erb(:homepage)
  end
  
  get '/signup' do 
    return erb(:signup)
  end

  post '/signup' do
    @username = params[:username]
    repo = UserRepository.new 
    repo2 = User.new 
    repo2.email = params[:email]
    repo2.password = params[:password]
    repo2.name = params[:name]
    repo2.username = @username
    repo.create(repo2)

    return erb(:signup_done)
  end 

  get '/peeps' do 
    repo = PeepRepository.new
    @peeps = repo.all 
    return erb(:homepage)
  end

  post '/peeps' do 
    repo = PeepRepository.new 
    repo2 = Peep.new 
    repo2.message = params[:message]
    @time = Time.now 
    repo2.time = @Time
    repo2.user_id = params[:user_id]

    repo.create(repo2)
    @peeps = repo.all 
    return erb(:homepage)
    return erb(:post_peep)
  end 
end
