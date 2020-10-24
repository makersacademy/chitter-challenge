require 'pg'

class Peeps 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
      result = connection.exec('SELECT * FROM peeps;')
      result.map { | peep | peep['message_content'] }
  end


end