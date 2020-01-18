require 'pg'

class Peep

  def self.view
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |post|
      post["body"]
    end
  end

end