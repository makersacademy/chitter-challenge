require 'sinatra'
require 'sinatra/activerecord'

class User < ActiveRecord::Base

  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :password

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
