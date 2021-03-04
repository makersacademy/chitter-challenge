require 'rake'
require_relative 'app/chitter'

Rake.application.load_rakefile
Rake::Task['setup_database_connection'].execute

use Rack::MethodOverride
run Chitter
