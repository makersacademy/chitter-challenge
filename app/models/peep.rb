require 'rubygems'
require 'dm-core'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String, length: 2000
  property :name, String
  property :username, String
  property :created_at, DateTime
  property :created_on, Date
  belongs_to :user
end
