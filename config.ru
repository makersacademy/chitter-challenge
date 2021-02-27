require 'rake'
require './app/chitter'

use Rack::MethodOverride

Rake.application.load_rakefile
Rake::Task['setup_database_connection'].execute

run Chitter
