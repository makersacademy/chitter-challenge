require 'active_record'

class User < ActiveRecord::Base

  has_many :peeps

  validates :email, confirmation: true
  validates :email, :uniqueness => { :message => "This email already exists" }
  validates :username, :uniqueness => { :message => "This username already exists" }
  validates :password, :presence => true
  
  def self.authenticate(username, password)
    user = find_by(username: username)
    return nil unless user

    if user.password == password
      user
    else
      nil
    end
  end
  
end
