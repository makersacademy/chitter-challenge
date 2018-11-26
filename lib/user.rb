require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id       , Serial
  property :firstname, String
  property :lastname , String
  property :username , String
  property :email    , String, format: :email_address
  property :password , BCryptHash

  has n, :peeps


  # def self.encrypted_password(password)
  #   BCrypt::Password.create(password)
  # end

end
