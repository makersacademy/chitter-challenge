ENV['RACK_ENV'] ||= 'development'

# require './app/models/database_config'
require 'sinatra/base'
# require './app/models/....rb'
# require './app/models/....rb'
# require 'bcrypt'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end
# Check if works without it
# run! if app_file == $0
end
