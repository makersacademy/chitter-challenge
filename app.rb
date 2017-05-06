ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, ''

  get '/' do
    erb(:index)
  end
end
