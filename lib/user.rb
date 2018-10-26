class User
  attr_reader :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user|
      User.new(id: user['id'], name: user['name'])
    }
  end

  def self.register(name)
    result = DatabaseConnection.query("INSERT INTO users(name) VALUES
    ('#{name}') RETURNING id, name;")
    result.map do |peep|
      User.new(id: peep['id'], name: peep['name'])
    end
  end
end
