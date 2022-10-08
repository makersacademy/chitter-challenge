require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/maker_repository'
require_relative 'lib/peep_repository'


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

  def invalid_request_params_signin
    maker_repo = MakerRepository.new
    all_makers = maker_repo.all

    if all_makers.include?(params[:username])
      return erb(:invalid_username)
    elsif all_makers.include?(params[:email])
      return erb(:invalid_email)
    end
  end

  post '/signin' do
    repo = MakerRepository.new
    new_maker = Maker.new
    new_maker.name = params[:name]
    new_maker.username = params[:name]
    new_maker.email = params[:email]
    new_maker.password = params[:password]

    invalid_request_params_signin

    repo.create(new_maker)
    return erb(:signin_success)
  end
end
