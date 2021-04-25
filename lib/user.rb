require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true

  def self.valid_login?(username, password)
    user = User.find_by(username: username)
    user.present? && (user.password == password)
  end

end
