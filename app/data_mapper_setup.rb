require "data_mapper"
require "dm-validations"
require "dm-postgres-adapter"

require_relative "models/user"
require_relative "models/peep"

local_postgres = "postgres://localhost/chitter_#{ ENV["RACK_ENV"] }"
DataMapper.setup(:default, ENV["DATABASE_URL"] || local_postgres)
DataMapper.finalize
DataMapper.auto_upgrade!
