require 'active_record'
require 'bcrypt'
class User < ActiveRecord::Base
  has_many :peeps
  has_secure_password

  include BCrypt

  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  # def self.authenticate(email, password)
  #   user = where('email = ?', email).first
  #   return user if user && user.authenticated?(password)
  # end

  # def authenticated?(password)
  #   self.password == encrypt(password)
  # end

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
end