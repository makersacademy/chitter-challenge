require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require_relative './data_mapper_setup'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, Text
  property :inception, DateTime

  belongs_to :user

end
