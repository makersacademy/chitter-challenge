require 'sinatra'
require 'sinatra/activerecord'

class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

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
