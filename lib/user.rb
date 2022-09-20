class User < ActiveRecord::Base
  validates :name, :username, :email, :password, presence: { strict: true }
  validates :username, :email, uniqueness: true
end


