require "pg"

class Peep
  def self.all
    connection = PG.connect(dbname: "chitter")
    result = connection.exec("SELECT peep FROM peeps;")
    result.map { |peep| peep["peep"] }
  end
end
