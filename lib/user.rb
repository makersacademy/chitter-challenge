require 'sinatra/activerecord'

class User < ActiveRecord::Base

  validates_presence_of :email
  validates :email, :uniqueness => { :message => "Email already signed up" }
  validates_presence_of :password
  validates_presence_of :name
  validates_presence_of :username
  validates :username, :uniqueness => { :message => "Username already in use" }

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
