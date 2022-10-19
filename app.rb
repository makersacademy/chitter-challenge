require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/maker_repository'
require_relative 'lib/peep_repository'
require_relative 'lib/maker'
require_relative 'lib/peep'



DatabaseConnection.connect

class Application < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all

    return erb(:index)
  end

  get '/signin/maker' do
    return erb(:signin)
  end

  post '/signin' do
    maker_repo = MakerRepository.new
    all_makers = maker_repo.all

    new_maker = Maker.new
    new_maker.name = params[:name]
    new_maker.username = params[:username]
    new_maker.email = params[:email]
    new_maker.password = params[:password]


    if all_makers.any?{|maker| maker.username == new_maker.username}
      return erb(:invalid_username)
    elsif all_makers.any?{|maker| maker.email == new_maker.email}
      return erb(:invalid_email)
    end

    maker_repo.create(new_maker)
    return erb(:signin_success)
  end

  get '/write_peep/new' do
    return erb(:write_peep)
  end

  post '/write_peep' do
    peep_repo = PeepRepository.new
    maker_repo = MakerRepository.new

    return erb(:write_peep_error1) unless maker_repo.username_exists(params[:username])
    return erb(:write_peep_error2) if maker_repo.loggedin(params[:username]) == 'false'

    maker = maker_repo.find_with_username(params[:username])

    new_peep = Peep.new
    new_peep.maker_id = maker.id
    new_peep.content = params[:content]
    
    peep_repo.create(new_peep)
    return erb(:write_peep_success)
  end

  get '/login/form' do
    return erb(:login)
  end

  post '/login' do
    maker_repo = MakerRepository.new
    
    return erb(:login_error) if !maker_repo.username_exists (params[:username])
      
    maker = maker_repo.find_with_username(params[:username])
    
    return erb(:login_error) if maker.email != params[:email] or maker.password != params[:password]
    
    maker_repo.log_in(params[:username])

    return erb(:login_success)
  end

  get '/logout/form' do
    return erb(:logout)
  end

  post '/logout' do
    maker_repo = MakerRepository.new
    
    return erb(:logout_error) if !maker_repo.username_exists (params[:username])
      
    maker = maker_repo.find_with_username(params[:username])
    
    return erb(:logout_error) if maker.password != params[:password]
    
    maker_repo.log_out(params[:username])

    return erb(:logout_success)
  end
end
