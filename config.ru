require 'rack'
require_relative 'app'

# configure.before(:each) do
#   ENV["database"] = "bookmark"
# end

run App
