require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= 'development'

class ChitterChallenge



  run! if app_file == $0
end
