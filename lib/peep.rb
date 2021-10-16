require "pg"

class Peep
  attr_reader :id, :text, :created_at

  def initialize(id:, text:, created_at:)
    @id = id
    @text = text
    @created_at = created_at
  end

  def self.all
    if ENV["APP_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY created_at DESC;")

    result.map do |peep|
      Peep.new(id: peep["id"], text: peep["text"], created_at: Time.parse(peep["created_at"]))
    end
  end

  def self.create(text:, created_at: Time.now)
    if ENV["APP_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec_params("INSERT INTO peeps (text, created_at) VALUES($1, $2) RETURNING id, text, created_at;", [text, created_at])
    Peep.new(id: result[0]["id"], text: result[0]["text"], created_at: result[0]["created_at"])
  end
end
