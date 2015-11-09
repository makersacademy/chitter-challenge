require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class HelloWorldApp < Sinatra::Base
  get '/' do
    erb :home
  end
end