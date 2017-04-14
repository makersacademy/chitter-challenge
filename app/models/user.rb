require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  has n, :rolls

  property :username, String
  property :password_digest, String, :length => 255
  property :id,       Serial
  property :name,     Text
  property :email,    Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email,password)
    user = first(email:email)

    if user && BCrypt::Password.new(user.password_digest) == password #this is not a string comparison
      #This converts password to bcrypt and then compares the two bcrypt-ed passwords
      user
    else
      nil
    end
  end

  validates_presence_of :name, :email, :username
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email, :username
  validates_confirmation_of :password


end
