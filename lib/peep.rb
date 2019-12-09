require 'pg'

class Peep

  def self.all 
    peeps = DatabaseConnection.connect.exec("SELECT * FROM peeps")
    peeps.map { |peep| peep['message'] }
  end

end