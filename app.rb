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

  get '/signin' do
    return erb(:signin)
  end

  def invalid_request_params_signin
    maker_repo = MakerRepository.new
    maker_repo.all

    if maker_repo.any?{|maker| maker.username == params[:username]}
      return erb(:invalid_username)
    elsif maker_repo.any?{|maker| maker.email == params[:email]}
      return erb(:invalid_email)
    end
  end
end
