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
    makers_repo = MakerRepository.new
    new_maker = Maker.new
    new_maker.name = params[:name]
    new_maker.username = params[:username]
    new_maker.email = params[:email]
    new_maker.password = params[:password]

    if makers_repo.maker_exists?(new_maker)
      return erb(:signup_failure_exists)
    else
      makers_repo.create(new_maker)
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
    makers_repo = MakerRepository.new
    maker = Maker.new
    maker.username = params[:username]
    maker.password = params[:password]
   
    id = makers_repo.find_id_by_username(maker.username)

    if makers_repo.password_match?(maker)
      makers_repo.login(id)
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
    makers_repo = MakerRepository.new
        
    if makers_repo.logged_in? == false
      return erb(:login_failure_absent)
    else
      return erb(:peep_new)
    end
  end

end
