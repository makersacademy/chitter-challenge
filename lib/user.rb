class User
  attr_reader :name, :password, :id

  def initialize(name:, password:, id:)
    @password = password
    @name = name
    @id = id
  end

  def self.create(name:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, password) VALUES('#{name}', '#{password}') RETURNING id, name, password;")
    User.new(name: result[0]['name'], password: result[0]['password'], id: result[0]['id'])
  end

end
