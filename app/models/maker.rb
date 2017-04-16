require 'bcrypt'

class Maker

  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,         Serial
  property :full_name,  String, required: true
  property :user_name,  String, required: true
  property :email,      String, format: :email_address, required: true
  property :password_digest,   Text

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    maker = first(email: email)
    if maker && BCrypt::Password.new(maker.password_digest) == password
      maker
    end
  end

  def user_exists?(maker)
    maker.exists? ? maker : false
  end

  def password_check(email, password)
    maker = first(email: email)
    BCrypt::Password.new(maker.password_digest) == password
  end



end
