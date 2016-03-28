require 'bcrypt'
class User
  include DataMapper::Resource

    property :id, Serial
    property :username, String
    property :email, String
    property :pwd_hash, String, length: 60

    def pass= password
      puts "baap"
      self.pwd_hash = BCrypt::Password.create password
    end

    def self.login username , pwd
      user = first(username: username)
      return nil if user.nil? || !(BCrypt::Password.new(user.pwd_hash) == pwd)
      user.id
    end

    has n, :peep

end
