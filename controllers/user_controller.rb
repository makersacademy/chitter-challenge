require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps_repository'
require './lib/user_repository'

class Singnup < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    set :public_folder, 'public'
    set :views, 'views'
    also_reload 'lib/peeps_repository.rb'


  # before do
  #   @space_repo = SpaceRepository.instance
  # end

    get '/signup' do
        return erb(:signup)
    end
  end

