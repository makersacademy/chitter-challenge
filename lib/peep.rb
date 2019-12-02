require "pg"

class Peep
  attr_accessor :id, :peep

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      conn = PG.connect(dbname: "peep_test")
    else
      conn = PG.connect(dbname: "peep")
    end
    result = conn.exec("SELECT * FROM peeps;")
    result.map { |peep| peep["peep"] }
  end

  def self.create(peep:)
    if ENV["ENVIRONMENT"] == "test"
      conn = PG.connect(dbname: "peep_test")
    else
      conn = PG.connect(dbname: "peep")
    end
    result = conn.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id, peep;")
  end
end
