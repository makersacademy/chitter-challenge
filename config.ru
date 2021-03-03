require 'pg'
require 'rake'
require_relative 'chitter'

use Rack::MethodOverride

DatabaseConnection.setup('d2fudekod14k43')

run Chitter
