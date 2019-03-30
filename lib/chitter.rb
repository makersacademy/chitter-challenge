require 'pg'

class Chitter
  def self.all
    ENV['ENVIRONMENT'] == 'test'? connection = PG.connect(dbname: 'chitter_app_test'): connection = PG.connect(dbname: 'chitter_app')
    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| peep['content'] }
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('someone', 'no username', CURRENT_TIMESTAMP, '#{content}');")
  end
end
