class User

  include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :username, String
    property :e_mail, String
    property :password, String

end
