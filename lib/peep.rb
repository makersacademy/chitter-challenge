require 'pg'

class Peep
  def self.all
    connection = Peep.connect
    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map{ |peep| Peep.new(peep['body']) }
  end

  def self.add(new_peep)
    connection = Peep.connect
    connection.exec("INSERT INTO peeps(body) VALUES('#{new_peep}');")
  end

  attr_reader :body

  def initialize(body)
    @body = body
  end

  private

  def self.connect
    databasename = ENV['ENV_TEST'] == 'test' ? 'chitter_testing' : 'chitter'
    PG.connect(dbname: databasename)
  end

end
