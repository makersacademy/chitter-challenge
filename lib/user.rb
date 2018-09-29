require 'data_mapper'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'
require_relative 'peep'
require 'rubygems'

DataMapper.setup(:default, 'postgres://localhost/chitter')

class User
 include DataMapper::Resource


 property :id,         Serial
 property :username,   String,    unique: true, required: true
 property :password,   String,    length: 7..20
 property :name,       String
 property :email,      String,    unique: true, required: true, format: :email_address

 has n, :peep

 def user_details=(new_username, password, name, email)
   @username = new_username
   @password = password
   @name = name
   @email = email
 end

end

DataMapper.auto_upgrade!
