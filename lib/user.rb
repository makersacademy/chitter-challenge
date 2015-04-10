class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  has n, :posts, through: Resource
  
  property :id,              Serial
  property :email,           String, unique: true
  property :password,        Text
  property :name,            String
  property :username,        String
end