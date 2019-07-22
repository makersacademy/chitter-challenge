require 'pg'

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("INSERT INTO registration (email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

end
