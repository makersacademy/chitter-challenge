require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

class Peeps
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, :length => 100
  property :created_at, DateTime

end

DataMapper.finalize
DataMapper.auto_upgrade!
