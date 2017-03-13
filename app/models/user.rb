require 'bcrypt'


class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :handle, String, required: true, unique: true
  property :bio, String, :length => 140, required: false
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  property :avatar, String, :length => 250

  validates_format_of       :avatar, :with => /https?:\/\/[\S]+/
  validates_confirmation_of :password
  validates_presence_of     :email
  validates_presence_of     :password, :if => :password_required
  validates_format_of       :email, as: :email_address

  has n, :peeps, :through => Resource, constraint: :destroy

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def get_auth_user

  end

  def authenticated?

  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
  # reduce to two lines

  def password_required
      self.password_digest.nil? || !@password.nil?
  end

end
