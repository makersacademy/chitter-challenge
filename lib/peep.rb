require 'pg'

class Peep
  attr_reader :message

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    results = con.exec("SELECT * FROM peeps;")
    results.map { |row| Peep.new(row['id'], row['message'], row['makerid']) }
  end

  def initialize(id, message, makerid)
    @id = id
    @message = message
    @makerid = makerid
  end
end
