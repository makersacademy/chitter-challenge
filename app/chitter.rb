ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base


end
