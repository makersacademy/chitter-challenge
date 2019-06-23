require 'pg'
class User

  attr_reader :id, :username, :password

  def initialize(id:, username:, password:)
    @id=id
    @username=username
    @password= password
  end

  def self.create(username:, password:)
    if ENV['ENVIRONMENT'] == "test"
      connect_to_database = PG.connect(dbname: 'chitter_test')
    else
      connect_to_database= PG.connect(dbname: 'chitter')
    end


      connect_to_database.exec("INSERT INTO users (username, password) VALUES('#{username}','#{password}')")

      add_to_database=connect_to_database.exec("SELECT * FROM users")

      User.new(id: add_to_database[0]['id'], username: add_to_database[0]['username'], password: add_to_database[0]['password'])

  end
end
