require "pg"

class Chitter
  def self.all
    ["hello"]

    #     connection = PG.connect(dbname: "chitterPeeps")
    #     result = connection.exec("SELECT * FROM peeps_table")
    #     result.map { |peep| peeps_table["peep"] }
  end

  def self.create(peep)
    connection.exec("INSERT INTO peeps_table")
  end
end
