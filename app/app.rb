ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
# require 'rake'
# require './app/model/link'
# require './app/model/user'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'really really secret'

  get '/' do

  end

  run! if app_file == $0
end
