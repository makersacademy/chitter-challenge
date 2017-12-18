require './app/data_mapper_setup'


class User
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String 
  property :user_name,  String
  property :email,      String
  property :password,   String

end
