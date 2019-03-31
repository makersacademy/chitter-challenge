require 'sinatra/activerecord'

class User < ActiveRecord::Base

has_many :messages
validates :email, uniqueness: true
validates :username, uniqueness: true


end 