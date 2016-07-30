class User
include DataMapper::Resource

property :id, Serial
property :user_name, Text
property :name, Text
property :password, Text
property :email, Text

end
