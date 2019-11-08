require "pg"

class Peep
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map { |peep| peep["url"] }
  end
end
