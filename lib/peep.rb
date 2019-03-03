require 'pg'

class Peep
attr_reader :peep, :time

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps1;")
    result.map {|peep| peep['peep']}

    # @peeps = [["First test peep", Time.new(2000)], ["Second test peep", Time.new(2003)], ["Third test peep", Time.new(2004)]]
    # @peeps.reverse!
  end

  def self.create(peep:,time: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps1 (peep) VALUES('#{peep}');")
    # @peeps = [["First test peep", Time.new(2000)], ["Second test peep", Time.new(2003)], ["Third test peep", Time.new(2004)]]
    #  @body = body
    #  @time = time
    #  peep = [@body, @time]
    #  @peeps << peep
    #  @peeps.reverse!
  end

end
