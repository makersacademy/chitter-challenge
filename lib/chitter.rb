require 'pg'

class Chitter

  attr_reader :peep, :time

  def initialize(peep, time)
    @peep = peep
    @time = time
  end

  def self.all
    rs = con.exec 'SELECT * FROM chitter';
    rs.map { |row| Chitter.new(row['peep'], row['time']) }
  end

  def self.add(peep, time)
    con.exec "INSERT INTO chitter (peep, time)
    VALUES('#{peep}', '#{time}')";
  end

  def self.con
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'chitter_manager_test'
    else
      PG.connect :dbname => 'chitter_manager'
    end
  end
end
