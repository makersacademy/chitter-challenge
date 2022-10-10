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
    maker_repo = MakerRepository.new
    new_maker = Maker.new
    new_maker.name = params[:name]
    new_maker.username = params[:username]
    new_maker.email = params[:email]
    new_maker.password = params[:password]

    return erb(:signup_failure_exists) if maker_repo.maker_exists?(new_maker)
    maker_repo.create(new_maker)
    return erb(:signup_success)
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
    maker_repo = MakerRepository.new
    maker = Maker.new
    maker.username = params[:username]
    maker.password = params[:password]
   
    id = maker_repo.find_id_by_username(maker.username)
    
    return erb(:login_failure) unless maker_repo.password_match?(maker)

    maker_repo.login(id)
    return erb(:login_success)
  end

  get '/login/failure' do
    return erb(:login_failure)
  end

  get '/peep/new' do
    maker_repo = MakerRepository.new
            
    return erb(:login_failure_absent) if maker_repo.logged_in_maker_id == 'none'
      
    id = maker_repo.logged_in_maker_id
    @username = maker_repo.find_username_by_id(id)
    @name = maker_repo.find_name_by_id(id)
    return erb(:peep_new)
  end

  get '/peep/success' do
    return erb(:peep_success)
  end

  post '/peep/new' do
    maker_repo = MakerRepository.new
    peep_repo = PeepRepository.new
    
    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.maker_id = maker_repo.logged_in_maker_id
    peep_repo.create(new_peep)

    return erb(:peep_success)
  end

  get '/logout' do
    maker_repo = MakerRepository.new
    id = maker_repo.logged_in_maker_id
    maker_repo.logout(id)

    return erb(:logout)
  end
end
