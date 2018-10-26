#\ -w -p 6789
require_relative "./app"
require 'rake'
use Rack::MethodOverride

ENV['ENVIRONMENT'] ||= 'development'
Rake.application.load_rakefile
Rake::Task['create_connection'].execute

run Chitter
