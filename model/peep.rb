require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :maker_name, String
  property :maker_username, String
  property :content, Text

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
