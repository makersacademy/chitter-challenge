require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
# require_relative 'lib/users_repository'
require_relative 'lib/peeps_repository'

DatabaseConnection.connect

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
#     also_reload 'lib/users_repository'
    also_reload 'lib/peeps_repository'
  end

  get '/' do
    peeps_repo = PeepRepository.new
    @peeps = peeps_repo.all
  
    # Debug statement
    # puts "@peeps: #{@peeps.inspect}"
  
    return erb(:peep)
  end  

  get '/signup' do
    return erb(:signup)
  end
end