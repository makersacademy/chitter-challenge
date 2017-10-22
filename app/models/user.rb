require 'data_mapper'
require 'dm-postgres-adapter'

class User

    include DataMapper::Resource

    has n, :peeps, through: Resource

    property :email, String
    property :name, String
    property :username, String
    property :password, String
end
