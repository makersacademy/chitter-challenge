require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    'Hello Chitter!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
