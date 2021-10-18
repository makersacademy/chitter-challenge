require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :body, :timestamp

  def initialize(id:, body:, clock:)
    @id = id
    @body = body
    @timestamp = clock
  end

  def self.all
    result = DatabaseConnection.query(
      "SELECT * FROM peeps
      ORDER BY id DESC;"
      )
    result.map do |peep| 
      Peep.new(id: peep['id'], body: peep['body'], clock: peep['time_record'])
    end
  end

  def self.create(clock = Time.now, body:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps
      (body, time_record) VALUES($1, $2)
      RETURNING id, body;", [body, clock]
    )
    Peep.new(id: result[0]['id'], body: result[0]['body'], clock: result[0]['time_record'])
  end
end
