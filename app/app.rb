ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require 'rake'
require 'sinatra/base'
# require each model here

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'really really secret'

  get '/' do
    "empty"
  end

  run! if app_file == $0
end
