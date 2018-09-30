require 'rubygems'
require "data_mapper"

#
if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end


#DataMapper.setup(:default, 'postgres://localhost/chitter')

class Chitter



  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :message,    String    # A varchar type string, for short strings      # A text block, for longer string data.
  property :created_at, DateTime
  property :posted_by,  String  # A DateTime, for any date you might like.
end

DataMapper.finalize
DataMapper.auto_upgrade!
