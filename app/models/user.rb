require 'sinatra'
require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_many :peeps

  def self.unique_email?(email)
    (User.where({ email: (email) }).first).nil?
  end

  def self.unique_username?(username)
    (User.where({ username: (username) }).first).nil?
  end
  
end