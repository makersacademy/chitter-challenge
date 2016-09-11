require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require_relative '../data_mapper_setup'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,  String
  property :email,      String
  property :password,   Text

  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email

end
