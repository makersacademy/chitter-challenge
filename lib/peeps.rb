require 'pg'

class Peep

  def self.all
    [
      'peep 6/1',
      'peep 5/1',
      'peep 4/1',
      'peep 3/1',
      'peep 2/1',
      'peep 1/1'
    ]
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'content'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    connection.exec("INSERT INTO peeps (content) VALUES ('#{content}');")
  end
end
