class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter_db')
    result = connection.exec("SELECT * FROM peeps;")
    result.map {|peep| peep['message_content']}
  end

end
