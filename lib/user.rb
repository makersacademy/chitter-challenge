class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true, :format => :email_address, :unique => true
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true
  property :password, String

end
