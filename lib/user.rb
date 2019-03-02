require './connect_to_database'

class User

  def initialize(id:, email:, name:, username:)
  end

  def self.create(email:, name:, username:, password:)
    result = DatabaseConnection.query("insert into users (email, name, username, password) values ('#{email}', '#{name}', '#{username}', '#{password}') returning id, email, username, name;")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end
end
