require 'pg'

class Peep
  def self.all
    connection = Peep.connect
    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map{ |peep| Peep.new(peep['body'], peep['date']) }
  end

  def self.add(new_peep)
    connection = Peep.connect
    connection.exec("INSERT INTO peeps(body, date) VALUES('#{new_peep}', '#{Date.today}');")
  end

  attr_reader :body, :date

  def initialize(body, date)
    @body = body
    @date = date
  end

  private

  def self.connect
    databasename = ENV['ENV_TEST'] == 'test' ? 'chitter_testing' : 'chitter'
    PG.connect(dbname: databasename)
  end

end
