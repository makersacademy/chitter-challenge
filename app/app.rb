ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'controllers/users'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'

class Chitter < Sinatra::Base


  run! if app_file == $0

end
