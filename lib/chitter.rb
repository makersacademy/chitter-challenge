require 'pg'

class Chitter
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    result = connection.exec("select * from chitter")
    result.map { |chitter| chitter['message'] }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    connection.exec("insert into chitter (message) values('#{message}');")
  end
end
