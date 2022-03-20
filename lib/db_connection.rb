require 'pg'
require_relative 'message'

class DbConnection
  class << self
    def connect
      @connection = PG.connect(dbname: database_name)
    end

    def request(command)
      @request = @connection.exec(command)
    end

    def safe_request(command, params)
      @request = @connection.exec_params(command, params)
    end

    def process
      @request.map do |message|
        Message.new(message['id'], message['message'], 
Time.parse(message['timestamp']).strftime('%F %T'))
      end
    end
    
    def database_name
      testing? ? 'chitter_test' : 'chitter_development'
    end

    def testing?
      ENV['RACK_ENV'] == 'test'
    end
  end
end
