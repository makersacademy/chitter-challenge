require 'pg'

class User
  attr_reader :id, :email

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def initialize(id:, email:)
    @id = id
    @email = email
  end

end
