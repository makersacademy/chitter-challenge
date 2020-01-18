require 'pg'

class Peep

  def self.view
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |post| post["body"] }
    
  end

end
