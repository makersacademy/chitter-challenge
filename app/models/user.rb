require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required:true, unique: false
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

  def self.authenticate(email, password)
    user = get_auth_user(email)
    user && authenticated(user, password) ? user : nil
  end

  def password_required
      self.password_digest.nil? || !@password.nil?
  end

  private

  def self.get_auth_user(email)
    first(email: email)
  end

  def self.authenticated(user, password)
    BCrypt::Password.new(user.password_digest) == password
  end

end
