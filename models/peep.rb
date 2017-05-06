require 'bcrypt'
require 'data_mapper'
require_relative 'user'
require_relative 'reply'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :date_time, DateTime

  belongs_to :user
  has n, :replies

end
