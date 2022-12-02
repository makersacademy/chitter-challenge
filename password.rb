require 'bcrypt'
encrypted_password = BCrypt::Password.create('dontguessme99')
p encrypted_password
