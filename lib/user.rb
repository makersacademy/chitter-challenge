class User
  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.create(name)
    result = DatabaseConnection.query("INSERT INTO users (name) VALUES ('#{name}') RETURNING id, name;")
    @user = User.new(id: result.first["id"].to_i, name: result.first["name"])
  end

  def self.instance
    @user
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    @user = User.new(id: result.first["id"].to_i, name: result.first["name"])
  end

  def self.find_name(id)
    result = DatabaseConnection.query("SELECT name FROM users WHERE id = #{id};")
    result.first["name"]
  end
end
