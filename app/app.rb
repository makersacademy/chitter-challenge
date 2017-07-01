
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative './models/peep'

require_relative './data_mapper_config'

require_relative './controllers/peeps'
