class User
  include DataMapper::Resource

    property :id, Serial
    property :first_name, String
    property :last_name, String
    property :username, String
    property :email, String
    property :password, String
end



