require_relative 'peep'

class Peeps

  def self.all(peeps_class = Peep, connection = connect)
    all_peeps = connection.exec("SELECT * FROM peeps;")
    all_peeps.map { |peep| peeps_class.new(peep['username'], peep['time'], peep['text'])}
  end
  # test all method !!

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
