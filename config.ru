#\ -w -p 6789
use Rack::MethodOverride

require 'rake'
Rake.application.load_rakefile
Rake::Task['create_connection'].execute

require_relative "./app"
run Chitter
