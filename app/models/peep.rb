require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep_text, Text, :required => true
  property :created_at, DateTime

  belongs_to :user

end
