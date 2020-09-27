require 'pg'

class Chit


  attr_reader :message, :id, :time

      def initialize(message:, id:, time:)
        @message = message
        @id = id
        @time = time
      end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chit_manager_test')
    else
      connection = PG.connect(dbname: 'chit_manager')
    end
    result = connection.exec("SELECT * FROM chits ORDER BY time DESC;")
    result.map do |chit|
      Chit.new(id: chit['id'], message: chit['message'], time: chit['time'])
    end
  end

  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chit_manager_test')
    else
      connection = PG.connect(dbname: 'chit_manager')
    end
    result = connection.exec("INSERT INTO chits (message) VALUES('#{message}')
    RETURNING id, message, time;")
    Chit.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
    end


end