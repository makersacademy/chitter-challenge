require 'data_mapper'
require 'dm-postgres-adapter'

class User

    include DataMapper::Resource

    has n, :peeps, through: Resource
    
    property :id, Serial
    property :email, String
    property :name, String
    property :username, String
    property :password, String
end
