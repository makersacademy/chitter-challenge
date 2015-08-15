class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true
  property :name, String, required: true
  property :email, String, required: true, :format => :email_address
  property :password, String


  validates_uniqueness_of :email, :username
end
