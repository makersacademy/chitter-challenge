require 'bcrypt'

    #  BCrypt::Password.new(user.password_digest) == password
password_digest  = "$2a$10$mhz7CY/2JC6hOHJgm58F8OHs0G6VGSzqqdwveIQ0KH8LZF.GtztM6"
 bcp = BCrypt::Password.new(password_digest)

 p bcp
