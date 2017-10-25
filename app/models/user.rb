require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :email, String, required: true, unique: true
  property :name, String, required: true
  property :password_digest, Text

  has n, :peeps
  #
  # has n, :relationships
  # has n, :followers, :through => :relationships, :model => 'User', :child_key => [:user_id]
  # has n, :follows, :through => :relationships, :model => 'User', :via => :user, :child_key => [:follower_id]

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
