require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require './app/controllers/base'
require './app/controllers/users'

module Chitter

  class ChitterApp < Sinatra::Base

    use Routes::Users

    # start the server if ruby file executed directly
    run! if app_file == $PROGRAM_NAME
  end

end
