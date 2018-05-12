class Peeps
  def self.peep(username, time, text, connection = connect)
    connection.exec("INSERT INTO peeps(username, time, text) VALUES('#{username}', '#{time}', '#{text}')")
  end

  private

  # def self.name(username, connection = connect)
  #   connection.exec("SELECT name FROM users WHERE username = '#{username}'")
  # end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'chitter_test'
    else
      PG.connect :dbname => 'chitter'
    end
  end
end
