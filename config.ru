require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/app.rb')
use Rack::Static, :urls => ['/images', '/javascripts'], :root => 'public'

run Chitter