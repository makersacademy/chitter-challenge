require 'pg'
require 'time'

class Peep

  def self.create(text:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 

    connection.exec("INSERT INTO peeps (text, name, datetime) VALUES('#{text}', '#{name}', '#{Time.now}') RETURNING id, text, name, datetime")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec("SELECT * FROM peeps;")
    result
  end
end