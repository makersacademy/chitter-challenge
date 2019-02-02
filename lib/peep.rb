require 'pg'
class Peep

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec( "SELECT * FROM peeps ORDER BY id DESC" )
    result.map do |peep|
      p peep['peep_content']
    end
  end

end
