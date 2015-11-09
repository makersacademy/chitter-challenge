require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class HelloWorldApp < Sinatra::Base
  get '/' do
    "Hello, world!"
  end
end