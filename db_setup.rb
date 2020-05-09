require 'sinatra'
require 'data_mapper'

require './models/peep'

configure :test do
  DataMapper.setup :default, 'postgres://localhost/chitter_test'
end

configure :development do
  DataMapper.setup :default, 'postgres://localhost/chitter'
end

DataMapper.auto_migrate!
