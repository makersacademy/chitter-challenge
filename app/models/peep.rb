require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       String
  property :author,     String
  property :created_at, DateTime

  belongs_to :user, :required => false

end


DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_upgrade!
