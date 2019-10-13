class UserPassword < ActiveRecord::Base
  def self.set(user, password)
    salt = BCrypt::Engine.generate_salt
    passhash = BCrypt::Engine.hash_secret(password, salt)
    UserPassword.create(user_id: user.id, passhash: passhash, salt: salt)
  end

# instance methods

  def check(password)
    attempt = BCrypt::Engine.hash_secret(password, salt)
    return false if attempt != passhash

    true
  end
end
