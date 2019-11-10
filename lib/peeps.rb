require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'

class Peeps
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, :length => 100
  property :created_at, DateTime

  # belongs_to :users

end
