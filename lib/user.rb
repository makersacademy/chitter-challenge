require 'sinatra/activerecord'

class User < ActiveRecord::Base

  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :name
  validates_presence_of :username

  def self.authenticate(username, password)
    user = first(username: username)
    return nil unless user

    if user.password == password
      user
    else
      nil
    end
  end

end
