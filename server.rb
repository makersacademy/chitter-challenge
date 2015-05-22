require 'sinatra'
require 'data_mapper'

require_relative './app/data_mapper_setup'

get '/' do
  erb :index
end
