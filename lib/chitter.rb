require 'pg'
require_relative 'database_connection'

class Chitter
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result =  DatabaseConnection.query("SELECT * FROM chits ORDER BY id DESC;")
    result.map { |chitter|Chitter.new(id: chitter['id'], message: chitter['message'], time: chitter['time']) }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO chits(message) VALUES('#{message}') RETURNING id, message, time;")
  end
end
