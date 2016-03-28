require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "postgres://localhost/chitter_development"

class Chitter < Sinatra::Base
  get '/' do
    erb(:home)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
