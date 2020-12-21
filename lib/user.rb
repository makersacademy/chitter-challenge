class User
  attr_reader :id, :name

  def initialize(id: id, name: name)
    @id = id
    @name = name
  end

  def self.create(name: name)
    result = db_connection.exec("INSERT INTO users (name) VALUES ('#{name}') RETURNING id, name;")
    User.new(id: result.first['id'].to_i, name: result.first['name'])
  end

  def self.db_connection
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'chitter_test'
    else
      PG.connect :dbname => 'chitter'
    end
  end
end
