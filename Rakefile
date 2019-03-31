require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'
# require 'bcrypt'
# require 'zlib'
# need pg here?

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end


# if ENV['ENVIRONMENT'] == 'test'
#   ('chitter_development')
# else
#   ('bookmark_manager')
# end

