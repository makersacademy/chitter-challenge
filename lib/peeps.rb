require 'pg'

class Peeps
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeplist;")
    result.map { |peep| p peep}


  @peeps = peeps
  end
end
