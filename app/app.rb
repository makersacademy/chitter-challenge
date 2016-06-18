ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require "sinatra/flash"

require_relative "data_mapper_setup"

require_relative "server"
require_relative "controllers/users"
require_relative "controllers/sessions"
require_relative "controllers/peeps"

class Chitter < Sinatra::Base
  run! if app_file == $PROGRAM_NAME
end
