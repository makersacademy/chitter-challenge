require 'pg'

class Peep
 attr_reader :id, :message, :time

  def initialize(id:, message:, time: Time.now)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
        connection = PG.connect(dbname: 'peeps_manager_test')
    else 
        connection = PG.connect(dbname: 'peeps_manager')
    end

    result = connection.exec("SELECT * FROM peeps;")
    list_of_peeps =result.map do |peep|
        Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end

    list_of_peeps.reverse

  end

  def self.create(message:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect( dbname: 'peeps_manager_test')
    else
      connection = PG.connect( dbname: 'peeps_manager')
    end

    time = Time.now
    result = connection.exec_params("INSERT INTO peeps (message,time) VALUES ($1,$2) RETURNING id, message, time;", [message,time])
    Peep.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
  end

end
