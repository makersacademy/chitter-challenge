class Users < ActiveRecord::Base
  validates :name, :username, :email, presence: { strict: true }
  validates :username, :email, uniqueness: true
end


