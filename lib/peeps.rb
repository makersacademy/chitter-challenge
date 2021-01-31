require 'pg'
# require 'Time'

class Peeps

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.create(peep:)
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, time;").first
    Peeps.new(id: result["id"], peep: result["peep"], time: Time.parse(result["time"]))
  end

  def self.all
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id desc;")
    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['peep'], time: Time.parse(peep['time']))
    end
  end
end
