require 'pg'

class Peep
  attr_reader :message

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['message']}
  end

end
