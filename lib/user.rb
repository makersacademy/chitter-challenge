class User < ActiveRecord::Base
  # ActiveRecord method for authentication
  has_secure_password #validations: false
end
