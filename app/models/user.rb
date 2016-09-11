require_relative '../data_mapper_setup'
require 'bcrypt'

class User < Sinatra::Base

  include DataMapper::Resource

  property :id, Serial
  property :username, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true
  property :name, String
  property :password_digest, Text

end
