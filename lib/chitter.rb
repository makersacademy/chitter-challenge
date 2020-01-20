require 'pg'

class Chitter
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM chits ORDER BY id DESC;")
    result.map { |chitter|chitter['message'] }
  end

  # def self.create(message:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'chitter_test')
  #   else
  #     connection = PG.connect(dbname: 'chitter')
  #   end
  #   result = connection.exec("INSERT INTO chits(message) VALUES('#{message}');")
  # end
end
