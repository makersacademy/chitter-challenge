ENV["RACK_ENV"] ||= "development"

# Gems
require 'sinatra/base'
require 'sinatra/flash'

# Helpers
require_relative 'data_mapper_setup'

# Server
require_relative 'server'

# Models
require_relative 'models/peep'
require_relative 'models/user'

# Controllers
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
