require 'pg'

class Peep

  attr_reader :id, :content, :post_time

  def initialize(id:, content:, post_time:)
    @id = id
    @content = content
    @post_time = post_time
  end

  def self.post(peep)
    database_connect
    result = @connection.exec_params("INSERT INTO peeps(peep, post_time) 
                                           VALUES($1, $2) 
                                        RETURNING id, peep, post_time", [peep, Time.now])
    Peep.new(id: result[0]['id'], content: result[0]['peep'], post_time: result[0]['post_time'])
  end

  def self.list
    database_connect
    result = @connection.exec("SELECT * FROM peeps")
    result.map { |peep| Peep.new(id: peep['id'], content: peep['peep'], post_time: peep['post_time']) }

  end

  private

  def self.database_connect
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else 
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end