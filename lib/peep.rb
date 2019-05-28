require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './user'


class Peep
  include DataMapper::Resource

  property :id,             Serial
  property :content,        Text, :lazy => false, :required => true
  property :creation_time,  Time

  belongs_to :user, :required => false
end
