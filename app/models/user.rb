require 'bcrypt'
require_relative 'email_token'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,       Serial
  property :name,     String
  property :email,    String, format: :email_address, required: true, unique: true
  property :username, String, required: true, unique: true
  property :password_digest,  BCryptHash, required: true
  property :password_token,   String
  property :token_created_at, Time

  has n, :peeps

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(password)
    @password = Password.create(password)
    self.password_digest = @password
  end

  def login(password)
    self.password == password ? self : nil
  end

  def update_password(pass, pass_confirmation)
    if pass == pass_confirmation
      self.password = pass
      self.save!
    else
      nil
    end
  end

  def destroy_token
    self.password_token = nil
    self.token_created_at = nil
    self.save!
  end

  def expired_token?
   !!((Time.now - self.token_created_at) > 3600)
  end

  def forgot_password
   random_password = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
   self.password_token = random_password
   self.token_created_at = Time.now
   self.save!
   EmailToken.call(self)
  end

end
