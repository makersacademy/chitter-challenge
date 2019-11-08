require "pg"

class Peep
  def self.all
    ENV["ENVIRONMENT"] == "test" ?
      connection = PG.connect(dbname: "chitter_test") :
      connection = PG.connect(dbname: "chitter")
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map { |peep| peep["peep"] }
  end
end
