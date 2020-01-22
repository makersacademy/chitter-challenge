require 'pg'

class Peep

attr_reader :id, :message, :created_at

  def initialize(id, message, created_at)
    @id = id
    @message = message
    @created_at = DateTime.parse(created_at)
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    peeps.map {|row| Peep.new(row['id'], row['message'], row['created_at'])}
  end

  def self.create(message)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (message) VALUES('#{message}');")
  end
end
