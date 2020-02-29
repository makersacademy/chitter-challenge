require 'sinatra'
require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_many :peeps
end