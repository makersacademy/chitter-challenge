require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end

    results = DatabaseConnection.query('SELECT * FROM peeps')

    peeps = results.map do |chitter|
      Peep.new(id: chitter['id'], peep: chitter['peep'], time: chitter['time'])
    end
  end

  def self.post(peep:)

    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end

    result = DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{Time.now}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end
end
