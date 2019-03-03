require 'time'

class Peep
  attr_reader :message, :time, :maker

  def self.all
    sql = "SELECT * FROM peeps ORDER BY createstamp DESC;"
    results = DatabaseConnection.query(sql)
    results.map { |row|
      Peep.new(row['id'], row['message'], row['makerid'], row['createstamp'])
    }
  end

  def self.add(message)
    sql = "INSERT INTO peeps (message, makerid, createstamp)
      VALUES ('#{message}', null, current_timestamp);"
    DatabaseConnection.query(sql)
  end

  def initialize(id, message, makerid, createstamp)
    @id = id
    @message = message
    if makerid != nil
      @maker = get_maker(makerid) 
    end
    @time = Time.parse(createstamp)
  end

  def get_maker(makerid, maker_class = Maker)
    maker_class.get(id: makerid)
  end
end
