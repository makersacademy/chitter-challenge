require 'data_mapper'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, "postgres://localhost/chitter_test.db")
else
  DataMapper.setup(:default, "postgres://localhost/chitter.db")
end

class Peep
  include DataMapper::Resource

  property :id         , Serial
  property :body       , Text

end

DataMapper.auto_upgrade!
