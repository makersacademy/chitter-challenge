class Users
  attr_reader :id, :name, :email, :password

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @email = args[:email]
    @password = args[:password]
  end

  class << self
    def create(args = {})
      result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{args[:name]}', '#{args[:email]}', '#{args[:password]}') RETURNING name, id")
      Users.new(id: result.first['id'], name: result.first['name'] )
    end
  end 
end
