require 'rake'
require_relative 'app/chitter'

Rake.application.load_rakefile
Rake::Task['db:connect'].execute

use Rack::MethodOverride
run Chitter
