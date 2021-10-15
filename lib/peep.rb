require "pg"

class Peep
  def self.all
    if ENV["APP_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep["text"] }
  end
end
