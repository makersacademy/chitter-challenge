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

  # def invalid_request_params_signin
  #   if all_makers.include?(new_maker.username)   #any?{|maker| maker.username == new_maker.username}
  #     return erb(:invalid_username)
  #   elsif all_makers.include?(new_maker.email)   #any?{|maker| maker.username == new_maker.email}
  #     return erb(:invalid_email)
  #   end
  # end

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
end
