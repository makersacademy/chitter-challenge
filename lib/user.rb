class User < ActiveRecord::Base
  has_many :messages

  validates :username, presence: true, uniqueness: true
  validates_presence_of :name, :password
  validates :email, uniqueness: true
end
