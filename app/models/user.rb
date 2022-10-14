class User < ActiveRecord::Base
  has_many :peeps

  validates :username, 
  uniqueness: true,
  presence: true,
  length: { in: 6..20 }

  validates :email, 
  uniqueness: true,
  format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :real_name, 
  presence: true,
  length: { in: 6..30 }

  validates :password,
  length: { in: 6..30 }

  has_secure_password
end