require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'

ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base
  get '/' do
    erb(:home_page)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
