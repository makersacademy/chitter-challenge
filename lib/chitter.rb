require_relative 'db_connection'

# Chitter Class
class Chitter
  class << self
    def all
      DbConnection.connect
      DbConnection.request('SELECT * FROM chitters;')
      DbConnection.process
    end

    def submit(message)
      DbConnection.connect
      result = DbConnection.safe_request(
        'INSERT INTO chitters (message) VALUES($1) RETURNING id, message, timestamp;',
        [message])
      process_submitted(result)
    end

    private

    def process_submitted(result)
      Message.new(result[0]['id'], result[0]['message'], Time.parse(result[0]['timestamp']).strftime('%F %T'))
    end
  end
end
