ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    "Hello World"
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
