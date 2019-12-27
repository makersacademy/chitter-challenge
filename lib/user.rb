require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :grip, uniqueness: true
end