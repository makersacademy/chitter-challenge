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
    # result.map { |peep, name|
    #   peep["peep"]
    #   peep["name"]
    # }
  end

  def self.create(name:, peep:)
    if ENV["ENVIRONMENT"] == "test"
      conn = PG.connect(dbname: "peep_test")
    else
      conn = PG.connect(dbname: "peep")
    end
    result = conn.exec("INSERT INTO peeps (peep, name) VALUES ('#{peep}', '#{name}') RETURNING id, peep, name;")
  end
end
