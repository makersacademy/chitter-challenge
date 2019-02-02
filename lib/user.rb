require 'active_record'
require 'pg'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true

end