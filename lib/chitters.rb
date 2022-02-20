require 'pg'

class Chitters

  def self.addpeep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}') RETURNING id, peep, ts ")
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
    
    # connection.exec("UPDATE chitter SET ts= DATE_TRUNC('SECOND',NOW());")
    # connection.exec("UPDATE chitter SET ts= date_trunc('ts', second);")

    # connection.exec("SELECT ts date_trunc('second','ts' ) AS date FROM chitter;")
    result = connection.exec('SELECT * FROM chitter ORDER BY ts DESC')

    return [result.map { |aaa| aaa['peep']}, result.map { |aaa| aaa['ts']} ]
    # return result.map { |aaa| aaa['ts']}
    # c = result.map{ |peeps, ts| peeps['peep'] ts['ts'] }
    
    # p "LOOOOOKKKKKKKK HHHHEEEERRRREEE"
    # p 'a is below'
    # p a
    # p 'b is below'
    # p b
    # # p 'c is below'
    # p c
  end

end