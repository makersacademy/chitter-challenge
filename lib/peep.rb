require 'pg'

Class Peep

  def self.all 
    peeps = DatabaseConnection.connect.exec("SELECT * FROM peeps")
    peeps.map { |peep| peep['message'] }
  end

end