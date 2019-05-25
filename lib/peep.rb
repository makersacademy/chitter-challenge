class Peep
  def self.send(message:)
    connection = connect_to_db
    connection.exec "INSERT INTO peeps (message) VALUES('#{message}');"
  end

  def self.all
    connection = connect_to_db
    result = connection.exec "SELECT * FROM peeps ORDER BY id DESC;"
    result.map { |peep| peep['message'] }
  end

  private_class_method

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(:dbname => 'chitter_test')
    else
      PG.connect(:dbname => 'chitter')
    end
  end
end
