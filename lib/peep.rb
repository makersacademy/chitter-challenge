require 'pg'
require './lib/database_connection'

class Peep
  attr_reader :id, :description, :creation_time

  def initialize(id:, description:,creation_time:)
    @id = id
    @description = description
    @creation_time = creation_time
  end

  def self.create(description:)
      clean = description.gsub(/\'/, "''")
      DatabaseConnection.query("INSERT INTO peeps(description,user_id) VALUES('#{clean}',0) RETURNING id,description")
  end

  def self.all
    result = DatabaseConnection.query("SELECT id, description, COALESCE(to_char(creation_time, 'HH24:MI'), '') AS creation_time FROM peeps ORDER BY id DESC;")
    result.map { |peep| Peep.new(id: peep['id'], description: peep['description'], creation_time: peep['creation_time'])}
  end

end
