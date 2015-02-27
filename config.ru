require 'rack/protection'
require './app/server'

use Rack::Session::Cookie, secret: SecureRandom.hex(64)
use Rack::Protection

run Server.new
