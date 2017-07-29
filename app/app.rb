ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

# require 'sinatra/flash'

class Chitter < Sinatra::Base

run! if app_file == $0
end
