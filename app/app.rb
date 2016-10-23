ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'models/data_mapper_setup'
require_relative 'server'
require_relative 'register'
require_relative 'peeps'
require_relative 'sessions'

 class Chitter < Sinatra::Base

  get '/' do
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
