require "pg"

class Chitter
  attr_reader :username, :peep, :time

  def initialize(username = "", peep = "", time = 0)
    @username = username
    @peep = peep
    @time = time
  end

  def user
    @username
  end

  def self.all
    connection = PG.connect(dbname: "chitterPeeps")
    result = connection.exec("SELECT * FROM peeps_table")
    result.map { |row| Chitter.new(row["username"], row["peep"], row["time"]) }
  end

  def self.create(peep)
    connection.exec("INSERT INTO peeps_table(id, username, peep, time) VALUES (2, @username, @peep, @time;")
  end
end
