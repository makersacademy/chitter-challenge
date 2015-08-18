require 'rubygems'
require File.join(File.dirname(__FILE__), './app/chitter_app.rb')

map "/public" do
  run Rack::Directory.new("./public")
end

run TheApp::Chitter