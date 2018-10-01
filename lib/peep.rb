require 'dm-core'
require 'dm-validations'
require 'dm-migrations'
require 'rubygems'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :created_at, DateTime
  belongs_to :user
end
