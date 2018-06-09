require 'pg'
require_relative './database_connection'


class Peep
  attr_reader :id, :peep

  def initialize(id, peep)
    @id = id
    @peep = peep
  end

  def self.save(options)
    result = DatabaseConnection.query("INSERT INTO peep_log (peep) VALUES('#{options[:peep]}') RETURNING id, peep;")
    Peep.new(result[0]['id'], result[0]['peep'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peep_log")
    result.map { |peep| Peep.new(peep['id'], peep['peep']) }
  end

end
