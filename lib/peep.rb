require 'pg'

class Peep

  def self.all
    peeps = DatabaseConnection.query "SELECT * FROM peeps"
    peeps.map { |peep| peep["body"] }
  end

  def self.create(peep)
    DatabaseConnection.query "INSERT INTO peeps(body) VALUES ('#{peep}')"
  end

end
