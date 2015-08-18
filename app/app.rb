require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'

class Chitter_Challenge < Sinatra::Base

  get '/' do
    erb :'/home/homepage'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
