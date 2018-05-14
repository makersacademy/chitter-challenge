require 'pg'
require 'data_mapper'

class Peeps
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :username, String
  property :time_created, DateTime

  
  def time
    time_created.strftime("%H:%M")
  end

  if ENV['ENVIRONMENT']=='test'
    DataMapper.setup(:default, 'postgres://localhost/chitter_test')
  else
    DataMapper.setup(:default, 'postgres://localhost/chitter')
  end
  DataMapper.finalize
end
