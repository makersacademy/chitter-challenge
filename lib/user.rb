require 'data_mapper'
require_relative 'database_connect'
require 'pg'

class User

include DataMapper::Resource

property :id,           Serial
property :name,         String
property :username,     String
property :email,        String
property :password,     String

     def self.all
       result = ConnectDatabase.query("SELECT * FROM new_user")
       result.map do |user|
         User.new(id: user['id'], name: user['name'], username: user['username'], email: user['email'], password: user['password'])
       end
     end

     def self.create(name:, username:, email:, password:)
       result = ConnectDatabase.query("INSERT INTO new_user (name, username, email, password)
       VALUES('#{name}', '#{username}', '#{email}', '#{password}')
       RETURNING id, name, username, email, password;")
       User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'],
                email: result[0]['email'], password: result[0]['password'])
     end

end

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize
DataMapper.auto_upgrade!
