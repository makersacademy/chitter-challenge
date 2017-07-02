
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'rack-flash'
require 'sinatra/partial'

require_relative './models/peep'
require_relative './models/user'

require_relative './controllers/peeps'
require_relative './controllers/users'

require_relative './data_mapper_config'

require_relative "helpers"
