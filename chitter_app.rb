require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
# require_relative 'lib/users_repository'
# require_relative 'lib/peeps_repository'

DatabaseConnection.connect('chitter')

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
#     also_reload 'lib/users_repository'
#     also_reload 'lib/peeps_repository'
  end


  get '/peeps' do
    @peeps = PeepsRepository.all
    return erb :peep
  end
end