class User < ActiveRecord::Base
  include BCrypt

  def self.register(username:, full_name:, email:, password:)
    encrypted_password = Password.create(password)
    user = self.create(username: username, full_name: full_name, email: email, password: encrypted_password)
  end

  def self.authenticate(username:, password:)
    user = self.where("username='#{username}'").first
    if user.nil?
      nil
    elsif user.password == password
      user
    else
      nil
    end
  end
end
