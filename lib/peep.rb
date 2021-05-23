require 'pg'

class Peep
  attr_reader :id, :message
  def initialize(id:, message:)
    @message = message
    @id = id
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

    result = con.exec("SELECT * FROM peeps")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'])
    end
  end
end
