require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :author, String, required: true
  property :user_name, String, required: true
  property :peep_time, DateTime, required: true
  property :text, Text, required: true, length: 120

end
