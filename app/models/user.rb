require 'data_mapper'

class User

    include DataMapper::Resource

    property :id,        Serial
    property :user_name, String
    property :email,     String

end
