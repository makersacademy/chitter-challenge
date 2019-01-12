require 'sinatra'
require 'sinatra/activerecord'

class User < ActiveRecord::Base

  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :password

end
