require 'pg'

class Chitter
  def self.all
    connection = PG.connect(dbname: 'chitter_db')
    result = connection.exec("select * from chitter")
    result.map { |chitter| chitter['message'] }
  end
end