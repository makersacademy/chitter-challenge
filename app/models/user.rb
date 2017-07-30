require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of   :email, :username

  property :id, Serial
  property :email, String, format: :email_address, required:true
  property :username, String, required:true
  property :full_name, String, required:true
  property :password_digest, Text, required:true

  validates_presence_of     :password, :if => :password_required

  has n, :peeps, through: Resource, constraint: :destroy
  has n, :replys, through: Resource, constraint: :destroy

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_required
      self.password_digest.nil? || !@password.nil?
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

end
