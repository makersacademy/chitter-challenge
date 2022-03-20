require 'pg'
require_relative 'message'
require 'time'
require 'date'

# Chitter Class
class Chitter
  class << self
    def all
      connect
      request('SELECT * FROM chitters;')
      process
    end

    def submit(message)
      connect
      result = safe_request(
        'INSERT INTO chitters (message) VALUES($1) RETURNING id, message, timestamp;',
        [message])
      process_created(result)
    end

    private

    def process_created(result)
      Message.new(result[0]['id'], result[0]['message'], Time.parse(result[0]['timestamp']).strftime('%F %T'))
    end

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
        Message.new(message['id'], message['message'], Time.parse(message['timestamp']).strftime('%F %T'))
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
