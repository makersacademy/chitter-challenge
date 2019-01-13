require 'data_mapper'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id,          Serial
  property :content,     String
  property :created_at,  DateTime

  belongs_to :user

end
