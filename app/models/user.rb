class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String
  property :name, String
  property :nickname, String
  property :password_digest, Text

  def password=(password)

  end
end
