class User < ActiveRecord::Base
  has_many :peeps
  validates_presence_of :username, :name, :email, :password
  validates :email, uniqueness: true
end
