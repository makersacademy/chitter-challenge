class User

  require 'bcrypt'
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :user_id, Serial
  property :username, String, required: true
  property :name, String, required: true
  property :email, String, required: true, format: :email_address
  property :password_digest, Text
  has n, :peeps

  def password=(password)
    @password = password # need that because validation doesnt work with nil password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email) #the first for which email is email provided
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  validates_uniqueness_of :username, :email
  validates_length_of :password, min: 6
  validates_confirmation_of :password
end
