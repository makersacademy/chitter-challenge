require 'pg'
class Chit
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chit;")
    result.map { |chit| chit['text']}
  end
end