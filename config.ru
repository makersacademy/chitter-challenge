require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/server.rb')
use Rack::Static,:urls => ['/images'], :root => 'public'

run Chitter