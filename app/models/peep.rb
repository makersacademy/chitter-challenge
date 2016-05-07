require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, String
  property :lastmodified, String
  property :username, String

  # belongs_to :user
end
