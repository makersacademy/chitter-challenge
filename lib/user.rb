require 'pg'

class User
  def self.create(name: , username: , email: , password: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'chitter_manager_test'
    else
      connection = PG.connect dbname: 'chitter_manager'
    end

    columns = '(name, username, email, password)'
    values = "('#{name}','#{username}','#{email}','#{password}')"
    result = connection.exec("INSERT INTO users #{columns} VALUES #{values} RETURNING *;").first

    User.new(
      id: result['id'],
      name: result['name'],
      username: result['username'],
      email: result['email']
    )
  end

  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end
end
