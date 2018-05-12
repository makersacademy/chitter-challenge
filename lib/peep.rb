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

  def self.all
    ["Hello World", "Second Peep", "Peep peep"]
  end

  if ENV['ENVIRONMENT'] == 'test'
    DataMapper.setup(:default, 'postgres://localhost/chitter_test')
    DataMapper.finalize
    DataMapper.auto_migrate!
  else
    DataMapper.setup(:default, 'postgres://localhost/chitter')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

end
