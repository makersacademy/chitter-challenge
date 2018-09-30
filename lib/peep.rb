require 'pg'

class Peep
  attr_reader :id, :time, :message

  def initialize(id:, time:, message:)
    @id = id
    @time = time
    @message = message
  end
  
  def self.all
    result = db_access.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], time: peep['time'], message: peep['message'])
    end
  end

  def self.create(message:)
    result = db_access.exec("INSERT INTO peeps (time, message) VALUES(
      CURRENT_TIMESTAMP, '#{db_access.escape_string(message)}')
       RETURNING id, time, message;")
    Peep.new(id: result[0]['id'], time: result[0]['time'],
      message: result[0]['message'])
  end

  def formatted_time
    return 'No time given' if @time.nil?
    DateTime.parse(@time).strftime('%d.%m.%Y %H:%M:%S')
  end

  private_class_method

  def self.db_access
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end
