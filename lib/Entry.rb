class Entry

  def self.add(peep)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO entry (text) VALUES ('#{peep}');")
  end

end