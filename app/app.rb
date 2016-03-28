ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'
require_relative 'controllers/sign_up'
require_relative 'data_mapper_setup'
require_relative 'controllers/chitter_feed'
require_relative 'controllers/session'

class Chitter < Sinatra::Base
  run! if __FILE__ == $0
end
