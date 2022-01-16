require 'pg'

class Peep
  attr_reader :message

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    result.map do |peep|
       peep['message']
    end
  end

  def self.create(message)
    connection = PG.connect(dbname: 'chitter')
    connection.exec_params("INSERT INTO peeps (message) VALUES('#{message}');")
  end
end