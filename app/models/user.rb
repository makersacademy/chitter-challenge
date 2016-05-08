class User
  include DataMapper::Resource
  has n, :peep, through: Resource

  property :id, Serial
  property :name, String, :required => true
  property :email, String, :required => true, 
    :unique => true, :format => :email_address
  property :password, BCryptHash, :required => true
  property :handle, String, :required => true, :unique => true

end