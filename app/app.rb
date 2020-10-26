ENV["RACK_ENV"] ||= "development"

# configure :development do
#   set :database, { adapter: "postgresql", encoding: "unicode", database: "chitter", pool: 2, username: "dan" }
# end

# configure :test do
#   set :database, { adapter: "postgresql", encoding: "unicode", database: "chitter_test", pool: 2, username: "dan" }
# end

require "bcrypt"
require "sinatra/base"
require "sinatra/activerecord"
require "sinatra/flash"

require_relative "lib/db_connection"

require_relative "models/user.rb"
require_relative "models/peep.rb"

require_relative "controllers/chitter"
