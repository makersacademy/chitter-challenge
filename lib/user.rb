require 'data_mapper'

class User
  include DataMapper::Resource

  property :id       , Serial
  property :username , String
  property :email    , String, format: :email_address
  property :password , String, length: 10..20
end
