require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peep_manager")
    result.map do |peep|
      p peep
    end
  end

end