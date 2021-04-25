require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true

  # def validate(:name, :email, :password, :username)

  # end
end