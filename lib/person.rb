
class Person
attr_reader :name, :id, :username, :password, :name, :email
  def initialize(name:, id:, username:, password:, email:)
    @name = name
    @id = id
    @username = username
    @password = password
    @email = email
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM people;")
    result.map do |person|
      Person.new(id: person['id'], name: person['name'],username: person['username'],email: person['email'], password: person['password'])
    end
  end


  def self.create(name:,username:,password:,email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO people (name, username, email, password) VALUES('#{name}', '#{username}','#{email}','#{password}') RETURNING id, name, username, email, password;")
    Person.new(id: result[0]['id'], name: result[0]['name'],username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

# add into inster name, password, email etc
end
