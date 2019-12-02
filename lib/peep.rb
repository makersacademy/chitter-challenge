class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    result = connection.exec("SELECT * FROM peeps")

    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"])
    end
  end

  def self.create(message:)
    result = connection.exec("INSERT INTO peeps (message)
      VALUES('#{message}')
      RETURNING id, message;")

    Peep.new(id: result[0]["id"], message: result[0]["message"])
  end

  def self.connection
    if ENV["ENVIRONMENT"] == "test"
      return PG.connect(dbname: "chitter_test")
    end

    return PG.connect(dbname: "chitter")
  end
end
