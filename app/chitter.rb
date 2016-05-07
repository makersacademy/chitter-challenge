ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'server'
require_relative 'data_mapper_setup'

require_relative './controllers/users'




class Chitter < Sinatra::Base

  get '/' do
    redirect '/user/new'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
