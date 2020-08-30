require 'database_connection'

class User
  attr_reader :id, :handle

  def initialize(id:, handle:)
    @id = id
    @handle = handle
  end

  def self.create(handle:, email:, password:)
    entry = DatabaseConnection.query(
      "INSERT INTO users (handle, email, password) 
       VALUES('#{handle}', '#{email}', '#{password}') 
       RETURNING id, handle;")
    User.new(id: entry[0]['id'], handle: entry[0]['handle'])
  end
end
