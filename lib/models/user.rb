require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
end
