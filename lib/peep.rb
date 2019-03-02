require 'time'

class Peep
  attr_reader :message, :time

  def self.all
    sql = "SELECT * FROM peeps ORDER BY createstamp DESC;"
    results = DatabaseConnection.query(sql)
    results.map { |row|
      Peep.new(row['id'], row['message'], row['makerid'], row['createstamp'])
    }
  end

  def initialize(id, message, makerid, createstamp)
    @id = id
    @message = message
    @makerid = makerid
    @time = Time.parse(createstamp)
  end
end
