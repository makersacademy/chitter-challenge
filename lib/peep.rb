require 'pg'

class Peep

  attr_reader :id, :peep, :time

  def initialize(id, peep, time)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    result = connect.exec("SELECT * FROM chits;")
    result.map { |row| Peep.new(row['id'], row['peep'], row['time']) }
  end

  def self.create(peep, time = Time.now.strftime("%Y-%d-%m %H:%M:%S %Z"))
    connect.exec("INSERT INTO chits (peep, time) VALUES ('#{peep}', '#{time}');")
  end

  def self.reverse
    result = connect.exec("SELECT peep, time FROM chits ORDER BY time desc;")
    result.map { |row| Peep.new(row['id'], row['peep'], row['time']) }
  end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end
