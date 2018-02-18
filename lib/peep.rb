require 'pg'

class Peep

  attr_reader :id, :post, :time

  def initialize(row)
    @id = row[0]
    @post = row[1]
    @time = row[2]
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    @array = []
    result.each_row { |row| @array.push(Peep.new(row)) }
    @array
  end

  def self.create(new_peep)
    sql = "INSERT INTO peeps (post, time) VALUES('#{new_peep}', 'NOW()');"
    DatabaseConnection.query(sql)
  end

end
