require 'rake'
require_relative 'app/controllers/chitter_controller'

Rake.application.load_rakefile
Rake::Task['setup_database_connection'].execute

use Rack::MethodOverride
run Chitter
