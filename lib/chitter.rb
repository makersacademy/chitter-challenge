require 'pg'
require 'date'

class Chitter
  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM chitter")
    result.map do |chitter|
      Chitter.new(id: chitter['id'], peep: chitter['peep'], time: DateTime.parse(chitter['time']))
    end
  end

  def self.create(peep:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("INSERT INTO chitter (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time;")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end
end
