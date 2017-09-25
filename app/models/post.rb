require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'pg'
require_relative 'user'
# for handling posts to the main page
class Post
  include DataMapper::Resource

  property :id, Serial
  property :body, String
  property :created_at, DateTime

  belongs_to :user
end
