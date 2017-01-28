require 'bcrypt'

class User

include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, BCryptHash

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  class <<self
    def count
      self.all.count
    end
  end

end
