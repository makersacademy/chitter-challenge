require 'bcrypt'
require 'data_mapper'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :date_time, DateTime

  belongs_to :user

end
