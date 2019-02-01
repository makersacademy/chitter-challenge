require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :body, Varchar(130), required: true
  property :created_at, DateTime

  DataMapper.auto_upgrade!

end
