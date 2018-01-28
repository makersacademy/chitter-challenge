ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/database_setup'

class Chitter < Sinatra::Base
end
