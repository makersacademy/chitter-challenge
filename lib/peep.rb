require 'pg'

class Peep

  attr_reader :id, :date, :time, :message, :sender

  def initialize(id:, date:, time:, message:, sender:)

    @id = id
    @date = date
    @time = time
    @message = message
    @sender = sender

  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec("SELECT * FROM peeps")

    peeps.map do |peep|
      Peep.new(id: peep['id'], date: peep['date'], time: peep['time'], message: peep['message'], sender: peep['sender'])
    end

  end

  def self.create(message:, sender:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end

    date = "#{Time.new.year}-#{Time.new.month}-#{Time.new.day}"
    time = "#{Time.new.hour}.#{Time.new.min}"

    result = connection.exec("INSERT INTO peeps (date, time, message, sender) VALUES('#{date}', '#{time}', '#{message}', '#{sender}') RETURNING id, date, time, message, sender;")
    peep = Peep.new(id: result[0]['id'], date: result[0]['date'], time: result[0]['time'], message: result[0]['message'], sender: result[0]['sender'])
    p peep.id
    p peep.date
    p peep.time
    p peep.message
    p peep.sender

    return peep

  end

end
