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

    if repo.maker_exists?(new_maker)
      return erb(:signup_failure_exists)
    else
      repo.create(new_maker)
      return erb(:signup_success)
    end
    
    return nil
  end


  get '/signup/failure/exists' do
    return erb(:signup_failure_exists)
  end

  get '/login' do
    return erb(:login)
  end

  get '/login/success' do
    return erb(:login_success)
  end

  post '/login' do
    repo = MakerRepository.new
    maker = Maker.new
    maker.username = params[:username]
    maker.password = params[:password]

    if repo.password_match?(maker)
      return erb(:login_success)
    else
      return erb(:login_failure)
    end
    
    return nil
  end

  get '/login/failure' do
    return erb(:login_failure)
  end

  get '/peep/new' do
    return erb(:peep_new)
  end

  get '/login/failure/absent' do
    return erb(:login_failure_absent)
  end
end
