# require 'dm-postgres-adapter'
# require 'data_mapper'
# require 'user'
# 
# class Post 
#     include DataMapper::Resource
#     property :slug       , String   , key: true, unique_index: true, default: lambda { |resource,prop| resource.title.downcase.gsub " ", "-" }
#     property :title      , String   , required: true
#     property :body       , Text     , required: true
#     property :created_at , DateTime
#     belongs_to :user
# end
# 
# DataMapper.finalize

# models/article.rb
require 'data_mapper'


class Article
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, Text
  property :published, Boolean, default: false
  property :published_on, Date, required: false
  property :likes, Integer, default: 0

  def publish!
    @published = true
    @published_on = Date.today
  end
end

DataMapper.finalize
