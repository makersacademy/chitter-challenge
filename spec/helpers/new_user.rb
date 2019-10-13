def new_user
  salt = BCrypt::Engine.generate_salt
  password = BCrypt::Engine.hash_secret("password", salt)
  User.create(name: "Guy", handle: 'guy', passhash: password, salt: salt)
end
