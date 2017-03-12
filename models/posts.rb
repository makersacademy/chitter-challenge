require 'data_mapper'
require 'rubygems'
class Post

  include DataMapper::Resource
  has n, :user, through: Resource
   property :id, Serial
   property :post, String
   property :created_at, Time
 end
