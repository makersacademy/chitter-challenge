require 'rubygems'
require 'dm-core'
require 'dm-validations'
require 'dm-migrations'

  # A Postgres connection:
if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://jamie:@localhost/messages_manager_test')
else
  DataMapper.setup(:default, 'postgres://jamie:@localhost/messages_manager')
end

class Post
  include DataMapper::Resource

  property :id, Serial # An auto-increment integer key
  property :content, Text # A text block, for longer string data.
  property :created_at, DateTime # A DateTime, for any date you might like.
  belongs_to :user
  # has n, :comments
end

  # class Comment
  #   include DataMapper::Resource
  #
  #   property :id,         Serial
  #   property :posted_by,  String
  #   property :email,      String
  #   property :url,        String
  #   property :body,       Text
  #   property :created_at, DateTime # A DateTime, for any date you might like.
  #   belongs_to :post
  #   # belongs_to :user
  # end

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, Text
  # ,:unique => true, :messages => { :is_unique => "Username is already taken"}
  property :firstname, Text
  property :lastname, Text
  property :email, String # , :unique => true
  property :password, String
  has n,   :posts
  # attr_accessor :password_confirmation
  #
  #   validates_presence_of     :username
  #   validates_uniqueness_of   :username
  #   validates_confirmation_of :password
end

DataMapper.auto_upgrade!
