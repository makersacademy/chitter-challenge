require 'pg'

class Peep

  attr_reader :id, :peep, :time

  def initialize(id, peep, time = Time.now)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    result = connect.exec("SELECT * FROM chits;")
    result.map { |row| Peep.new(row['id'], row['peep'], row['time']) }
  end

  def self.create(peep, time = Time.now)
    result = connect.exec("INSERT INTO chits (peep, time) VALUES ('#{peep}', '#{time}');")
  end

  def self.reverse
    connect.exec("SELECT peep, time FROM chits ORDER BY time desc;")
  end

private

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
