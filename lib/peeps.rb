class Peeps

  def self.all
    query = "SELECT * FROM peeps ORDER BY created;"
    DBWrapper.database_send(query).map { |row| initialize(row) }   
  end

  def self.initialize(peep)
    Peeps.new(created: peep['created'], message: peep['message'])
  end

  def self.create(message)
    query = "INSERT INTO peeps (message) VALUES ('#{message}');"
    DBWrapper.database_send(query)
  end

  attr_reader :created, :message

  def initialize(created:, message:)
    @created = created
    @message = message
  end
  
end
