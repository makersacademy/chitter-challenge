require 'dm-core'
require 'dm-validations'
require 'dm-migrations'
require 'rubygems'
require_relative 'peep'

class User
  include DataMapper::Resource

  property :id, Serial
  property :user, Text
  property :firstname, Text
  property :lastname, Text
  property :email, String
  property :password, Text
  has n, :peeps
end
