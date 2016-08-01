require 'dm-validations'
class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :user_name,  String
  property :name,       String
  property :peep,       String
  property :time,       Time
  belongs_to :user
end
