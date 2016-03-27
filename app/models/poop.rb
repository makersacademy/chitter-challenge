require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../data_mapper_setup'
require 'dm-timestamps'
require_relative 'user'

class Poop
  include DataMapper::Resource


  property :id, Serial
  property :poop_msg, String
  property :username, String
  property :name, String
  property :time_posted, Date
  property :created_at, DateTime

end


