require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitters ORDER BY id DESC;")
    result.map { |chitter| chitter['message'] }
  end
end
