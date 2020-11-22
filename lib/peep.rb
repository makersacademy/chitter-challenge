require 'pg'

class Peep

  def self.add(name:, handle:, post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (name, handle, post) VALUES('#{name}','#{handle}','#{post}')")
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    results = connection.exec('SELECT * FROM peeps ORDER by id DESC;')
  end

end
