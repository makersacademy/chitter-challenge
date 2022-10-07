require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/maker_repository'

DatabaseConnection.connect

class Application < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/maker_repository'
  end

  get '/' do
    peep_repo = PeepRepository.new
    @maker_repo = MakerRepository.new
    @peeps = peep_repo.all.reverse!
   
    return erb(:index)
  end

  get '/signup' do
    return erb(:signup)
  end

  get '/signup/success' do
    return erb(:signup_success)
  end

  post '/signup' do
    repo = MakerRepository.new
    new_maker = Maker.new
    new_maker.name = params[:name]
    new_maker.username = params[:username]
    new_maker.email = params[:email]
    new_maker.password = params[:password]

    if maker_exists?(new_maker)
      return erb(:signup_failure_exists)
    else
      repo.create(new_maker)
      return erb(:signup_success)
    end
    
    return nil
  end

  def maker_exists?(new_maker)
    repo = MakerRepository.new
    exists = false

    repo.all.each do |maker|
      exists = true if maker.username == new_maker.username || maker.email == new_maker.email
    end

    return exists
  end

  get '/signup/failure/exists' do
    return erb(:signup_failure_exists)
  end

end
