require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :user_id, Integer
  property :peep, Text

  belongs_to :user
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
