require 'pg'

class Chitter
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chits;")
    result.map { |chitter|chitter['message'] }
  end

  def self.create(message:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO chits(message) VALUES('#{message}');")
  end
end
