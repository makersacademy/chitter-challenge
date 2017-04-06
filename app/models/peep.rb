# new signed up peeps
require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

    property :id, Serial
    property :email, String
    property :password, String
    property :name, String
    property :user_name, String

end
