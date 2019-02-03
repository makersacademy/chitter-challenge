require 'active_record'

class User < ActiveRecord::Base
  has_many :peeps
  validates_presence_of :username, :forename, :surname, :email, :password
  validates_uniqueness_of :username, :email
end
