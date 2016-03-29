class Users
  include DataMapper::Resource

    property :id, Serial
    property :username, String
    property :email, String
    property :password, String, :length => 60

    has n, :peeps

end
