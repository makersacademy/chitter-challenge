require 'rubygems'
require File.join(File.dirname(__FILE__), 'lib/chitter.rb')
use Rack::Static, :urls => ["/css", "/images"], :root => "public"
run Chitter
