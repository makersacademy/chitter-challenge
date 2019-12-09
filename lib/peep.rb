require 'time'
require 'pg'

class Peep

  attr_reader :message, :date, :time

  def initialize(id:, date:, message:, time:)
    @id = id
    @date = date
    @message = message
    @time = time
  end

  def self.all
    con = connect_database
    peeps = con.exec('SELECT * FROM chitter')
    peeps.map do |peep|
      Peep.new(id: peep['id'], date: peep['date'], message: peep['msg'], time: peep['time'])
    end
  end

  def self.create(message:)
    con = connect_database
    result = con.exec("INSERT INTO chitter (date, msg, time) VALUES('#{date_of_msg}', '#{message}', '#{time_of_msg}') RETURNING id, date, msg, time;")
    Peep.new(id: result[0]['id'], date: result[0]['date'], message: result[0]['msg'], time: result[0]['time'])
  end

  def self.connect_database
    database = ENV['ENVIRONMENT'] == 'test' ? 'chitter_chatter_test' : 'chitter_chatter'
    con = PG.connect(dbname: database)
  end

  def self.time_of_msg
    time_obj = Time.new
    time =  "#{time_obj.hour}:#{time_obj.min}:#{time_obj.sec}"
  end

  def self.date_of_msg
    time_obj = Time.new
    date = "#{time_obj.year}-#{time_obj.month}-#{time_obj.day}"
  end
end
