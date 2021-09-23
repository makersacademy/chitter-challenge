require 'pg'

class User
  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email  
  end

  def self.create(name:, username:, email:, password:)
    result = PGDatabase.new_user(name: name, username: username, email: email, password: password)
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = PGDatabase.find_user(id: id)
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end
end
