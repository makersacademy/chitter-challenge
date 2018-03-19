require_relative './db_connection_setup.rb'

class User

  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all
    result = DBconnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['name']) }
  end

  def self.setup(new_user)
    DBconnection.query("INSERT INTO users (name) VALUES('#{new_user[:name]}');")
  end

end
