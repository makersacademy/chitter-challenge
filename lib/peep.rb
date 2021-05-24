require 'pg'

class Peep
  attr_reader :id, :message, :time
  def initialize(id:, message:, time:)
    @message = message
    @id = id
    @time = time
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: "chitter_test")
    else
      con = PG.connect(dbname: "chitter")
    end

    con.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message;")
  end

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: "chitter_test")
    else
      con = PG.connect(dbname: "chitter")
    end

    result = con.exec("SELECT * FROM peeps ORDER BY time DESC;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end
  end
end
