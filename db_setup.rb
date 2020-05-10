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
  User.new(id: 20, name: 'D Kolakowski', user_name: 'Dec', password: '12', email: 'd@d').save
  Peep.new(body: 'cats', created_at: Time.now, created_by: 20).save
  Peep.new(body: 'pancakes', created_at: Time.now - 3600, created_by: 20).save
  Peep.new(body: 'feelings', created_at: Time.now - 2000, created_by: 20).save
end
