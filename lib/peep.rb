require 'pg'

class Peep
  def self.all
    connection = Peep.connect
    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map{ |peep| Peep.new(peep['body'], peep['time']) }.reverse
  end

  def self.add(new_peep)
    connection = Peep.connect
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    connection.exec("INSERT INTO peeps(body, time) VALUES('#{new_peep}', '#{time}');")
  end

  attr_reader :body, :time

  def initialize(body, time)
    @body = body
    @time = time
  end

  private

  def self.connect
    databasename = ENV['ENV_TEST'] == 'test' ? 'chitter_testing' : 'chitter'
    PG.connect(dbname: databasename)
  end    

end
