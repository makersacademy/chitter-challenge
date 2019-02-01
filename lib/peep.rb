require 'pg'

class Peep
  def self.all
    databasename = ENV['ENV_TEST'] == 'test' ? 'chitter_testing' : 'chitter'
    connection = PG.connect(dbname: databasename)
    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map{ |peep| Peep.new(peep['body']) }
  end

  attr_reader :body

  def initialize(body)
    @body = body
  end

end
