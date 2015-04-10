class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  has n, :posts, through: Resource
  
  property :id,              Serial
  property :email,           String, unique: true, message: 'This email address has be taken'
  property :password,        Text
  property :name,            String, unique: true, message: 'This name has be taken'
  property :username,        String
end