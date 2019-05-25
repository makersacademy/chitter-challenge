class Peep
  def self.send(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(:dbname => 'chitter_test')
    else
      connection = PG.connect(:dbname => 'chitter')
    end

    connection.exec "INSERT INTO peeps (message) VALUES('#{message}');"
  end
end
