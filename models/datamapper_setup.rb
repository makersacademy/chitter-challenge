require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require "dm-validations"

configure :development do
  DataMapper.setup(:default, "postgres://localhost/chitter_dev")
end

configure :test do
  DataMapper.setup(:default, "postgres://localhost/chitter_test")
end


configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end
