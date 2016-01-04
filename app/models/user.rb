require 'dm-validations'
class User
  include DataMapper::Resource

  has n, :posts, through: Resource

  property :id,       Serial
  property :username, String
  property :name,     String
  property :email,    Text, :required => true, :format => :email_address
  property :password, BCryptHash, length: 255
  attr_accessor :password_confirmation

  validates_confirmation_of :password,
    :message => "Password and confirmation password do not match"

  validates_uniqueness_of :email,
    :message => "Email address is already in use!"

  def self.authenticate(email, password)
      user = first(email: email)
      if user && BCrypt::Password.new(user.password) == password
        user
      else
        nil
      end
  end

end
