require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :body

  def initialize(id:, body:)
    @id = id
    @body = body
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep| 
      Peep.new(id: peep['id'], body: peep['body'])
    end
  end

  def self.create(body:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps
      (body) VALUES($1)
      RETURNING id, body;", [body]
    )
    Peep.new(id: result[0]['id'], body: result[0]['body'])
  end
end
