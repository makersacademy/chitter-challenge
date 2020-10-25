require 'database_connection'

class Maker

  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name:, email:)
    result = DatabaseConnection.query("INSERT INTO maker (name, email) VALUES('#{name}', '#{email}') RETURNING id, name, email;")
    Maker.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM maker WHERE id = '#{id}''")
    Maker.new(result[0]['id'], result[0]['name'])
  end

end