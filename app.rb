require "sinatra"
require "sinatra/reloader"
require_relative "lib/database_connection"
require_relative "lib/user_repository"
require_relative "lib/peep_repository"
require "date"

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @title = "Chitter - Home"
    return erb(:index)
  end

  get '/peeps' do
    @title = "Chitter - Latest peeps"
    @peeps = PeepRepository.new.all
    return erb(:peeps)
  end

  get '/peeps/new' do
    @title = "Chitter - Create a new peep"
    return erb(:new_peep)
  end
end