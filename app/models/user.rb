require 'bcrypt'

class User

include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, BCryptHash


  attr_reader :password, :name, :password_digest
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      p user
      user
    else
      nil
    end
  end

  class <<self
    def count
      self.all.count
    end
  end

end
