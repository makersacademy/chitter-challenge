require 'pg'

class Chitters

  def self.addpeep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}')")
    # result = connection.exec('SELECT * FROM chitter')
    # result.map { |peeps| peeps['peep']}
  end

  def self.view_peeps
    # ["test peep"]

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # result = connection.exec('SELECT * FROM chitter')
    result = connection.exec('SELECT * FROM chitter ORDER BY id DESC')
    #result = connection.exec('SELECT * FROM chitter ORDER BY ts DESC')
    result.map { |peeps| peeps['peep']}
  end

end