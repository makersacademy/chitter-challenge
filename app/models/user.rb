require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :user_name,        String
  property :user_email,       String, :required => true, :unique => true

  validates_format_of :user_email, :as => :email_address

end
