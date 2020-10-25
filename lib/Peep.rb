require 'pg'

class Peep

  def self.list
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      peep['message']
    end
  end

end
