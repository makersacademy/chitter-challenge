require 'data_mapper'

class User

  property :user_name, String, required => true
  property :password_digest, Text, required => true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
