require "pg"

class Peep
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")

    result.map { |peep| peep["peep"] }
  end

  def self.add_peep(peep:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("INSERT INTO peeps (peeps) VALUES('#{peep}');")
  end
end
