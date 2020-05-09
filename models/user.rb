require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String
  property :password, String

  def self.get_user_by_name(name)

  end
end
