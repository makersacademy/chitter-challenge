require 'sinatra/base'
require 'pry'
require_relative './data_mapper_setup'


ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret ,''

  get '/' do
    erb :index
  end

end
