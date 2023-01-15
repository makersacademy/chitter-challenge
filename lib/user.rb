require 'bcrypt'

class User
    attr_accessor :id, :name, :username, :email, :password_hash

    def password
        @password ||= BCrypt::Password.new(self.password_hash)
    end

    def password=(new_password)
        @password = BCrypt::Password.create(new_password)
        self.password_hash = @password
    end
end