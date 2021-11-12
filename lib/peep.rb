require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['content'] }
    #   'this is a test, should be Ginny as user',
    # 'this is another test message, Ginny as user',
    # 'test message, Jon as user',
    # 'Grace as user'
  end
end
