class Peep

  attr_reader :id, :text, :time

  def initialize(id, text, time=nil)
    @id = id
    @text = text
    @time = time
  end

  def self.create(peep)
    time = format_time
    sqlquery = "INSERT INTO peeps(text, time) VALUES('#{peep}', '#{time}') RETURNING id, text, time"
    result = DatabaseConnection.query(sqlquery)
    Peep.new(result[0]['id'], result[0]['text'], result[0]['time'])
  end

  def self.all
    sqlquery = "SELECT * FROM peeps;"
    result = DatabaseConnection.query(sqlquery)
    result.map { | peep | Peep.new(peep['id'], peep['text'], peep['time']) }.reverse!
  end

  private

  def self.format_time
    Time.now.strftime("%I:%M%p on %m/%d/%Y")
  end

end
