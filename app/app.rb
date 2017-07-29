ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'mail_setup'
class Chitter < Sinatra::Base
end
require_relative 'controllers/application_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/peep_controller'
