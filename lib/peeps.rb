require 'pg'

class Peep

  attr_reader :id, :message, :time_stamp

  def initialize(id:, message:, time_stamp:)
    @id = id
    @message = message
    @time_stamp = time_stamp
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else 
      conn = PG.connect(dbname: 'chitter')
    end

    results = conn.exec("SELECT * FROM peeps ORDER BY id DESC")
    
    if results.num_tuples.zero?
      ['No Records']
    else
      
      results.map { |peep|
        Peep.new(id: peep['id'], message: peep['message'], 
       time_stamp: DateTime.parse(peep['time_stamp']).strftime('%l: %M %p'))
      }      
    end
    
  end

  def self.create(message:)

    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else 
      conn = PG.connect(dbname: 'chitter')
    end

    conn.exec_params("INSERT INTO peeps (message) VALUES($1);",[message])

  end

end
