class Entry

  def self.add(peep)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO entry (text) VALUES ('#{peep}');")
  end

  def self.all 
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM entry;")
    result.map { |peep| peep['text'] }
  end

end