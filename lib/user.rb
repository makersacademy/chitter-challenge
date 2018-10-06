class User < ActiveRecord::Base
  validates_presence_of :username, :name, :email, :password
  validates :email, uniqueness: true
end
