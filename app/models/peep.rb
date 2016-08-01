require 'dm-validations'
class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :user_name,  String
  property :peep,       String

  belongs_to :user
end
