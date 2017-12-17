require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, Text
  property :name, String
  property :username, String

  has n, :peeps

  def set_password(password)
    self.password = BCrypt::Password.create(password)
  end

  def self.find_by_user_id(user_id)
    all.select { |user| user.id == user_id }.first
  end

end
