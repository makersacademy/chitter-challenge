require 'bcrypt'

class User

  include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :username, String
    property :e_mail, String
    property :password_digest, Text


    has n, :peeps, :through => Resource

    def password=(password)
      self.password_digest = BCrypt::Password.create(password)
    end

end
