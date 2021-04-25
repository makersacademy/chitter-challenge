require 'timecop'
class Peep
  attr_reader :id, :texts, :time

  def initialize(id, texts, time)
    @id = id
    @texts = texts
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |row| peep = Peep.new(row["id"], row["texts"], row["time"]) end
  end

  def self.create(texts)
    DatabaseConnection.query("INSERT INTO peeps (texts) VALUES ('#{texts}');")
    # Peep.new(result["id"], result["texts"])
  end

  def self.time(id)
    #query returning time from the time column in the database
    result = DatabaseConnection.query("SELECT time FROM peeps WHERE id = '#{id}';")
    result.map do |row| 
      peep = Peep.new(row["id"], row["texts"], row["time"])
      time = DateTime.parse(peep.time)
      p time = time.strftime('%d %b %Y at %H:%M')
      p time.to_s
    end
  end

end