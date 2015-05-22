require 'sinatra'
require 'data_mapper'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

require_relative 'models/user'
require_relative 'models/peep'

require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/users'

DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'super secret'