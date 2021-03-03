require 'rake'

require_relative 'chitter'

use Rack::MethodOverride

DatabaseConnection.setup('DATABASE_URL')

run Chitter
