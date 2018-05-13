class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true, :unique => true, :format => :email_address
  property :user_name, String, :required => true, :unique => true
  property :password, String, :required => true

  has n, :peeps
end
