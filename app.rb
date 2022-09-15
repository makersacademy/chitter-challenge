require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
    @peeps = PeepRepository.new.all
    return erb(:peeps)
  end

  get '/peeps/new' do
    return erb(:peeps_new)
  end

end