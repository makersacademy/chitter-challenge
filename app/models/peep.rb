require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user.rb'


class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :time , Time

  has 1, :user , :through => Resource
end
