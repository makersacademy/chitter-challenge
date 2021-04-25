class Peep
  def self.create(peep)
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{peep}');")
  end
end
