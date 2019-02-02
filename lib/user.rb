require 'active_record'
require 'pg'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true, uniqueness: true
end