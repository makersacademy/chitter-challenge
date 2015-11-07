require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class PeepController < Sinatra::Base

  get '/' do

  end

  run! if app_file == $PROGRAM_NAME
end
