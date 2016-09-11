require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'  #provides automatic updates of created_at

class Peep
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :posted_by,  String
  property :created_at, DateTime  # A DateTime, for any date you might like.
  property :body,       Text      # A text block, for longer string data.
end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
