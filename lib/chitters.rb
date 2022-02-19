require 'pg'

class Chitters

  def self.addpeep(peep)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}')")
    # result = connection.exec('SELECT * FROM chitter')
    # result.map { |peeps| peeps['peep']}
  end

  def self.view_peeps
    # ["test peep"]
    connection = PG.connect(dbname: 'chitter')
    # result = connection.exec('SELECT * FROM chitter')
    result = connection.exec('SELECT * FROM chitter ORDER BY id DESC')
    result.map { |peeps| peeps['peep']}
  end

end