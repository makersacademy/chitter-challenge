
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :content, Text
end

DataMapper.finalize
DataMapper.auto_upgrade!
