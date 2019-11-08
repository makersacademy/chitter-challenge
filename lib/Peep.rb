require 'pg'

class Peep
  def self.all
    if ENV['Environment'] == 'test'
      connect = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    results = connection.exec("SELECT * FROM comment;")
    result.map { |peep| peep['comment']}
  end
end