require 'pg'

class User

  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.create(email, password)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "peep_manager_test")
    else
      connection = PG.connect(dbname: "peep_manager")
    end

    result = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email, password;")

    User.new(result[0]["id"], result[0]["email"], result[0]["password"])
  end
end