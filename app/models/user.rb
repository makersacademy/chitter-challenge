require "data_mapper"
require "dm-postgres-adapter"
#require "bcrypt"
require "dm-validations"

class User

  include DataMapper::Resource

  property :id,              Serial
  property :email,           String, required: true, unique: true
  property :name,            String

  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email

end
