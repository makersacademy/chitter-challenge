require_relative 'db_connection'

# Chitter Class
class Chitter
  class << self
    def all
      DbConnection.connect
      DbConnection.request(show_all_query)
      DbConnection.process
    end

    def submit(message)
      DbConnection.connect
      result = DbConnection.safe_request(submit_query, [message])
      process_submitted(result)
    end

    private

    def process_submitted(result)
      Message.new(result[0]['id'], result[0]['message'], 
Time.parse(result[0]['timestamp']).strftime('%F %T'))
    end

    def show_all_query
      'SELECT * FROM chitters;'
    end

    def submit_query
      'INSERT INTO chitters (message) VALUES($1) RETURNING id, message, timestamp;'
    end
  end
end
