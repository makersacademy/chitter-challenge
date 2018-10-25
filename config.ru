#\ -w -p 6789
ENV['ENVIRONMENT'] ||= 'development'
require_relative "./app"
require_relative "./database_connection_setup"
use Rack::MethodOverride
run Chitter
