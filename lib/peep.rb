require 'pg'

class Peep

  attr_reader :id, :peep, :current_t_stamp

  def initialize(id, peep, current_t_stamp)
    @id = id
    @peep = peep
    @timestamp = current_t_stamp
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| Peep.new(peep['id'], peep['peeps'], peep['current_t_stamp']) }
    # result.map { |peep| peep['peeps'] }
  end

  def self.send(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO chitter (peeps) VALUES('#{peep}')")
  
  end

  # def time
  #   Time.parse(timestamp).strftime('%B %d')
  # end

end
