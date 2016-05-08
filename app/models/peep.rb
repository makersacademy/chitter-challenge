require 'data_mapper'
require 'dm-postgres-adapter'
# require_relative 'user'

class Peep

  include DataMapper::Resource 

  property :id, Serial 
  property :content, String
  property :time, DateTime
  # belongs_to :user

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!