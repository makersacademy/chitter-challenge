require 'pg'

class Peep

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps1;")
    # result.map {|peep| peep['peep']}
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
    # @peeps = [["First test peep", Time.new(2000)], ["Second test peep", Time.new(2003)], ["Third test peep", Time.new(2004)]]
    # @peeps.reverse!
  end

  def self.create(peep:,time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps1 (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
    # @peeps = [["First test peep", Time.new(2000)], ["Second test peep", Time.new(2003)], ["Third test peep", Time.new(2004)]]
    #  @body = body
    #  @time = time
    #  peep = [@body, @time]
    #  @peeps << peep
    #  @peeps.reverse!
  end



end
