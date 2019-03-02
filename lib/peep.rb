class Peep
  attr_reader :message

  def self.all
    sql = "SELECT * FROM peeps ORDER BY createstamp DESC;"
    results = DatabaseConnection.query(sql)
    results.map { |row| Peep.new(row['id'], row['message'], row['makerid']) }
  end

  def initialize(id, message, makerid)
    @id = id
    @message = message
    @makerid = makerid
  end
end
