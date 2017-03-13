require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'peep'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :email,    String
  property :username,      String
  property :name,      String
  property :password_digest,      Text

  def self.check_password(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      false
    else
      true
    end
  end

  def self.check_if_user_exists(username, email)
    return "Username is taken" if first(username: username) != nil
    return "An account already exists with this Email" if first(email: email) != nil
    false
  end

  def self.check_confirm_password(pass1, pass2)
    pass1 == pass2
  end
end



DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")
