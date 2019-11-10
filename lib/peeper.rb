require 'pg'

class Peeper

  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name:, email:, password:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter_live')
    end

    result = connection.exec("INSERT INTO peepers (name, email, password) 
      VALUES('#{name}', '#{email}', '#{password}') RETURNING id, name, email, password")
    Peeper.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], 
      password: result[0]['password'])
  end

end
