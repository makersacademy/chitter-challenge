require 'sinatra'
require 'data_mapper'

require './models/peep'
require './models/user'

configure :test do
  DataMapper.setup :default, 'postgres://localhost/chitter_test'
end

configure :development do
  DataMapper.setup :default, 'postgres://localhost/chitter'
end

DataMapper.auto_migrate!

configure :development do
  Peep.new(body: 'cats', created_at: Time.now).save
  Peep.new(body: 'pancakes', created_at: Time.now + 3600).save
  Peep.new(body: 'feelings', created_at: Time.now - 2000).save
end
