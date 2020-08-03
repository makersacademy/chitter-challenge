require File.expand_path('app', File.dirname(__FILE__))

use Rack::Static, :urls => ['/stylesheets', '/images'], :root => 'public'
use Rack::MethodOverride


run ChitterApp
