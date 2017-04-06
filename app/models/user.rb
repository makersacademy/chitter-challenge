# new signed up peeps
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

    property :id, Serial
    property :email, String, :required => true, :format => :email_address, unique: true
    property :password, String
    property :name, String
    property :user_name, String

end
