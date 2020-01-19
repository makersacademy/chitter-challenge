require 'pg'

class Peep

  def self.view
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep["body"] }
  end

  def self.create(body)
    result = DatabaseConnection.query("INSERT INTO peeps (body) VALUES('#{body}')")
  end

end
