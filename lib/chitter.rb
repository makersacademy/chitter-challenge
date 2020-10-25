require 'pg'
#rename file
class Peep

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @time = time
    @peep = peep
    @id = id
  end

  def self.all
    if  ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_manager_test' )
    else
      connection = PG.connect( dbname: 'chitter_manager' )
    end
    rs = connection.exec("SELECT * FROM peeps;")
    rs.map do |post|
      Peep.new(id: post['id'], peep: post['peep'], time: post['post_time'])
    end
  end

  def self.create(peep:, time:)
    if  ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_manager_test' )
    else
      connection = PG.connect( dbname: 'chitter_manager' )
    end
    result = connection.exec("INSERT INTO peeps (peep, post_time) VALUES('#{peep}', '#{time}') RETURNING id, peep, post_time")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['post_time'])
  end
end

#currently returning an array of strings from database
#- need to return separately with time stamp, name and username