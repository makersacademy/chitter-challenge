require 'pg'

class Chit

  def self.all
      result = connect.exec("SELECT * FROM chits;")
      result.map { |row| row['chit'] }
  end

  def self.create(chit, time = Time.now)
    connect.exec("INSERT INTO chits (chit, time) VALUES ('#{chit}', '#{time}');")
  end

private

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
