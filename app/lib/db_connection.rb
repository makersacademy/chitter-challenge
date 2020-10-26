require "pg"

module DBConnection
  def self.exec(sql_query)
    begin
      if ENV["RACK_ENV"] == "test"
        dbname = "chitter_test"
      else
        dbname = "chitter"
      end
      connection = PG.connect :dbname => dbname
      connection.exec(sql_query)
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end
end
