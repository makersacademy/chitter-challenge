require 'data_mapper'
# require 'pry'

class Post

  include DataMapper::Resource

  property :id, Serial

  property :message, Text, required: true
  property :created_at, DateTime

  belongs_to :user


end
