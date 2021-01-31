require 'pg'

class Peep

    attr_reader :id, :message, :date, :time

    def initialize(id:, message:, date:, time:)
        @id = id
        @message = message
        @date = date
        @time = time
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
          else
            connection = PG.connect(dbname: 'chitter')
          end
        result = connection.exec('SELECT * FROM peeps;')
        result.map do |peep|
            Peep.new(id: peep['id'], message: peep['message'], date: peep['date'], time: peep['time'])
        end
    end

    def self.post(message:)
        connection = PG.connect(dbname: 'chitter')
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("INSERT INTO peeps (message, date, time) VALUES('#{message}', current_date, current_time) RETURNING id, message, date, time;")
        Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'], time: result[0]['time'])
    end   
end