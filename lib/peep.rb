require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    peeps = result.map { |peep| peep['content'] }
    peeps.reverse
  end

end