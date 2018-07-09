require 'rake'
require_relative "./app"

Rake.application.load_rakefile
Rake::Task['dev_database_reset'].execute

run Chitter
