require 'pg'

class Peeps
  class << self
    def all
      connect
      request('SELECT * FROM peeps;')
      process
    end

    private

    def connect
      @connection = PG.connect(dbname: "chitter")
    end

    def request(command)
      @request = @connection.exec(command)
    end

    def process
      @request.map do |row| 
        row['peep']
      end
    end
  end
end
