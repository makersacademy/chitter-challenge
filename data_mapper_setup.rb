# require 'dm-core'
# require 'dm-timestamps'
# require 'dm-migrations'
# require 'dm-validations'

# env = ENV['RACK_ENV'] || 'development'
# DataMapper.setup(:default, "postgres://dani:5807@localhost/chitter")

# class User
#   include DataMapper::Resource

#   property :id        , Serial
#   property :username  , String, key: true
#   property :firstname , String
#   property :lastname  , String
#   property :email     , String , format: :email_address
#   property :password  , String , length: 8..40
#   # property :peep      , String VARCHAR(188)
#   property :created_at, DateTime
#   property :updated_at, DateTime

#   has n, :posts

#   def username= new_username
#     super new_username.downcase
#   end
# end

# class Post
#   include DataMapper::Resource

#   # property :slug      , String, key: true
#   property :peep      , String, key: true, length: 1..188
#   property :created_at, DateTime
#   property :updated_at, DateTime

#   belongs_to :user
# end

# DataMapper.auto_upgrade!

# # DataMapper.finalize
