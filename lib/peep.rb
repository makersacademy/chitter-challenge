require 'data_mapper'
# require 'bcrypt'
# require 'dm-validations'

class Peep

  include DataMapper::Resource
  attr_reader :user

  # belongs_to :user

  property :id, Serial
  property :message, Text
  property :user, String

end
