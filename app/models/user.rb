class User < ActiveRecord::Base
  has_many :peeps

  validates :username, presence: { message: "Please enter username" }
  # uniqueness: { message: "#{value} already exists" },
  # length: { in: 6..20, message: "#{attribute} should be within 6-20 characters" }
  # # validates :username 
  # # validates :email

  has_secure_password

end