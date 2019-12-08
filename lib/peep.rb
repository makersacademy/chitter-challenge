class Peep

  attr_reader :content

  def initialize(content)
    @content = content
  end

  def self.all
    if ENV['RACK_ENV'] = 'test'
      connection = PG.connect(dbname: 'chitter_test_database')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
      database = connection.exec("SELECT * FROM peeps;")
      database.map { |peep| peep['content'] }
  end
end
