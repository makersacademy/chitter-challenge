ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative './data_mapper_setup'

require_relative 'server'
require_relative 'helpers'
require_relative 'controllers/navigation'
require_relative 'controllers/peeping'
require_relative 'controllers/users'
# Great to have these broken out! I'd love to see some way of preserving
# encapsulation too.
