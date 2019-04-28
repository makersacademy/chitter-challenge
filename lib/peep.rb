require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id  = id
    @peep = peep
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end

    result = DatabaseConnection.query('SELECT * FROM peeps')

    peeps = result.map do |peep|
      { peep: peep['peep'] }
    end

    peeps.reverse
  end

  def self.post(peep:)
    DatabaseConnection.query("INSERT INTO peeps VALUES (#{peep});")
  end
end
