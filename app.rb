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

  post '/' do 
    email = params[:email]
    repo = UserRepository.new 
    repo2 = User.new
    repo.all.each do |user|
      if user.email == email
        @error_message = 'Email already registered. Please re-submit or sign-in.'
        return erb(:homepage)
      end 

      repo.create(repo2)
      return erb(:signup_done) 
    end 
  end 


  get '/login' do 
    return erb(:login)
  end

  post '/login' do
    repo = UserRepository.new 
    repo2 = User.new 
    repo2.password = params[:password]
    repo2.username = params[:username]

    redirect '/peeps'
  end 

  get '/login_done' do 
    return erb(:login_done)
  end 

  get '/signup_done' do
    return erb(:signup_done)
  end 

  get '/peeps' do 
    repo = PeepRepository.new
    @peeps = repo.all 
    return erb(:peeps)
  end

  get '/make_peep' do 
    return erb(:make_peep)
  end 

  post '/peeps' do 
    repo = PeepRepository.new 
    repo2 = Peep.new 
    repo2.message = params[:message]
    @time = Time.now 
    repo2.time = @time

    repo.create(repo2)
    @peeps = repo.all 
    return erb(:peeps)
  end
end
