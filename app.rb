ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'app/data_mapper_setup'

class Chitter < Sinatra::Base

  run! if app_file == $0

end
