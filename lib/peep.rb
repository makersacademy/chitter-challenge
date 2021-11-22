require 'pg'

class Peep

  def self.create(peep:, name:, username:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (peep, name, username) VALUES('#{peep}','#{name}','#{username}');")
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| [peep['name'], peep['username'], peep['peep']] }
    
  end
end
