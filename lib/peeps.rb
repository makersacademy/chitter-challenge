require 'pg'

class Peeps

  def self.all
    database_connection
    all_peeps = @connection.exec("SELECT * FROM peeps;")
    all_peeps.map { |peep| peep }
  end

  def self.post(text)
    database_connection
    @connection.exec("INSERT INTO peeps (peep) VALUES ('#{text}');")
  end

private

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end
