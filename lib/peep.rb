require 'pg'

class Peep
  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'chitter_test')
    else
      return PG.connect(dbname: 'chitter')
    end
  end

  def self.all
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] }
  end

  def self.create(options)
    connection.exec("INSERT INTO peeps (peep) VALUES('#{options[:peep]}')")
  end
end
