require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

class ChitterApp < Sinatra::Base
  get '/' do
    'Hello chitter-challenge!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
