require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-core'
require 'dm-validations'
require 'dm-migrations'


class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :username, String
  property :created_at, DateTime

  # def self.all
  #   ["Hello World", "Second Peep", "Peep peep"]
  # end

  DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!

end
