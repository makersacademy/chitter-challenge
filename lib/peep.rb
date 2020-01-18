require 'pg'

class Peep

  def self.view
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep["body"] }
  end

end
