ENV["RACK_ENV"] ||= "development"

require_relative 'views/data_mapper_setup'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'yes'

  get '/' do
    erb(:index)
  end
end
