require 'pg'

  class Chitter

    attr_reader :id, :message, :time
    
    def self.create(message:)
      time = Time.new.strftime("%T")
      result = DatabaseConnection.query("INSERT INTO peeps (message, time) 
      VALUES('#{message}', '#{time}') 
      RETURNING id, message, time")
      Peep.new(
        id: result[0]['id'],
        message: result[0]['message'],
        time: result[0]['time']
      )
  end

    def self.all
      result = DatabaseConnection.query('SELECT * FROM peeps')
      result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        time: peep['time']
      )
    end
  end
end