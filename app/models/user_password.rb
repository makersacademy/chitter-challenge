class UserPassword
  def self.create(user, password)
    salt = BCrypt::Engine.generate_salt
    passhash = BCrypt::Engine.hash_secret(password, salt)

    user.passhash = passhash
    user.salt = salt
  end

  def self.check(password:, salt:, passhash:)
    attempt = BCrypt::Engine.hash_secret(password, salt)
    return false if attempt != passhash

    true
  end
end
