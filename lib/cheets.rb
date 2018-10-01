require './app'
require 'data_mapper'

DataMapper.setup(:default, 'postgres://localhost/chitter')

class Cheets

  include DataMapper::Resource
  property :id,         Serial
  property :body,       String
  property :created_at, DateTime

  DataMapper.finalize
  DataMapper.auto_migrate!
  DataMapper.auto_upgrade!

  Cheets.create body: 'Test Cheet One', created_at: Time.now
  Cheets.create body: 'Test Cheet Two', created_at: Time.now
  Cheets.create body: 'Test Cheet Three', created_at: Time.now
end
